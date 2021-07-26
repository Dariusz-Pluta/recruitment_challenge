import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/core/models/weather_model.dart';
import 'package:recruitment_challenge/core/repositories/domain/location_repository.dart';
import 'package:recruitment_challenge/core/weather_api/weather_api.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final LocationRepository _locationRepository;

  CurrentWeatherCubit(this._locationRepository)
      : super(CurrentWeatherState(
          LocalizationModel(country: '', city: ''),
          WeatherModel(mainInfo: {}, weatherInfo: [], windInfo: {}),
          '',
          '',
          CurrentWeatherStage.initial,
        ));

  void getPosition(BuildContext context) async {
    final String localeIdentifier =
        '${Localizations.localeOf(context).languageCode}_${Localizations.localeOf(context).countryCode ?? 'UK'}';
    final result = await _locationRepository.getCurrentLocalization();

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (position) => _getAddressFromPosition(position, localeIdentifier),
    );
  }

  void _getAddressFromPosition(
      Position position, String localeIdentifier) async {
    final result = await _locationRepository.getAddressFromPosition(
      position,
      localeIdentifier,
    );

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (address) => emit(state.setStateToAddressReady(address)),
    );
  }

  void getCurrentWeather(
      String city, String unitCall, String languageCode) async {
    final weather = WeatherApi(Dio());
    final result = await weather.getWeather(city, unitCall, languageCode);

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (weatherModel) => _getIconURL(weatherModel),
    );
  }

  void _getIconURL(WeatherModel weatherModel) async {
    final String icon = weatherModel.weatherInfo.first['icon'];
    final String url = 'https://openweathermap.org/img/wn/$icon@2x.png';
    emit(state.setStateToWeatherReady(weatherModel, url));
  }
}
