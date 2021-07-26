import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/core/models/weather_model.dart';
import 'package:recruitment_challenge/core/repositories/domain/hive_repository.dart';
import 'package:recruitment_challenge/core/weather_api/weather_api.dart';

part 'selected_location_state.dart';

class SelectedLocationCubit extends Cubit<SelectedLocationState> {
  final HiveRepository _repository;

  SelectedLocationCubit(this._repository)
      : super(SelectedLocationState(
          WeatherModel(
            mainInfo: {},
            weatherInfo: [],
            windInfo: {},
          ),
          false,
          '',
          '',
          SelectedLocationStage.initial,
        ));

  void isFavorite(LocalizationModel model) async {
    final result = await _repository.isFavorite(model);

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (isFavorite) => emit(state.setStateToFavChecked(isFavorite)),
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

  void addToFavorite(LocalizationModel model) async {
    final result = await _repository.addFavorite(model);
    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (_) => emit(state.setStateToAddedFav()),
    );
  }

  void removeFromFavorites(LocalizationModel model) async {
    final result = await _repository.removeFavorite(model.city!);
    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (_) => emit(state.setStateToRemovedFav()),
    );
  }
}
