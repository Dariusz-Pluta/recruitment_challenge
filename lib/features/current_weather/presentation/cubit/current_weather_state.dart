part of 'current_weather_cubit.dart';

class CurrentWeatherState extends Equatable {
  final LocalizationModel hiveFavoriteModel;
  final WeatherModel weatherModel;
  final String imageUrl;
  final String errorMessage;
  final CurrentWeatherStage stage;

  const CurrentWeatherState(
    this.hiveFavoriteModel,
    this.weatherModel,
    this.imageUrl,
    this.errorMessage,
    this.stage,
  );

  LocalizationModel get address => hiveFavoriteModel;
  WeatherModel get weather => weatherModel;

  bool get initial => stage == CurrentWeatherStage.initial;
  bool get addressReady => stage == CurrentWeatherStage.addressReady;
  bool get weatherReady => stage == CurrentWeatherStage.weatherReady;
  bool get urlClaimed => stage == CurrentWeatherStage.urlClaimed;
  bool get error => stage == CurrentWeatherStage.error;

  CurrentWeatherState setStateToAddressReady(
          LocalizationModel hiveFavoriteModel) =>
      copyWith(
        hiveFavoriteModel: hiveFavoriteModel,
        stage: CurrentWeatherStage.addressReady,
      );

  CurrentWeatherState setStateToWeatherReady(
    WeatherModel weatherModel,
    String imageUrl,
  ) =>
      copyWith(
        weatherModel: weatherModel,
        imageUrl: imageUrl,
        stage: CurrentWeatherStage.weatherReady,
      );

  CurrentWeatherState setStateToError(String errorMessage) => copyWith(
        errorMessage: errorMessage,
        stage: CurrentWeatherStage.error,
      );

  @override
  List<Object> get props =>
      [hiveFavoriteModel, weatherModel, errorMessage, stage];

  CurrentWeatherState copyWith({
    LocalizationModel? hiveFavoriteModel,
    WeatherModel? weatherModel,
    String? imageUrl,
    String? errorMessage,
    CurrentWeatherStage? stage,
  }) {
    return CurrentWeatherState(
      hiveFavoriteModel ?? this.hiveFavoriteModel,
      weatherModel ?? this.weatherModel,
      imageUrl ?? this.imageUrl,
      errorMessage ?? this.errorMessage,
      stage ?? this.stage,
    );
  }
}

enum CurrentWeatherStage {
  initial,
  addressReady,
  weatherReady,
  urlClaimed,
  error,
}
