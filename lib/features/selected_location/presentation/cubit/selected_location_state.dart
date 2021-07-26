part of 'selected_location_cubit.dart';

class SelectedLocationState extends Equatable {
  final WeatherModel weatherModel;
  final bool isFav;
  final String imageUrl;
  final String errorMessage;
  final SelectedLocationStage stage;

  const SelectedLocationState(
    this.weatherModel,
    this.isFav,
    this.imageUrl,
    this.errorMessage,
    this.stage,
  );

  WeatherModel get weather => weatherModel;
  bool get isFavourite => isFav;

  bool get initial => stage == SelectedLocationStage.initial;
  bool get weatherReady => stage == SelectedLocationStage.weatherReady;
  bool get favChecked => stage == SelectedLocationStage.favChecked;
  bool get addedToFavorites => stage == SelectedLocationStage.addedFav;
  bool get removedFromFavorites => stage == SelectedLocationStage.removedFav;
  bool get error => stage == SelectedLocationStage.error;

  SelectedLocationState setStateToWeatherReady(
    WeatherModel weatherModel,
    String imageUrl,
  ) =>
      copyWith(
        weatherModel: weatherModel,
        imageUrl: imageUrl,
        stage: SelectedLocationStage.weatherReady,
      );

  SelectedLocationState setStateToFavChecked(bool isFavourite) => copyWith(
        isFav: isFavourite,
        stage: SelectedLocationStage.favChecked,
      );

  SelectedLocationState setStateToAddedFav() => copyWith(
        isFav: true,
        stage: SelectedLocationStage.addedFav,
      );

  SelectedLocationState setStateToRemovedFav() => copyWith(
        isFav: false,
        stage: SelectedLocationStage.removedFav,
      );

  SelectedLocationState setStateToError(String errorMessage) => copyWith(
        errorMessage: errorMessage,
        stage: SelectedLocationStage.error,
      );

  @override
  List<Object> get props =>
      [weatherModel, isFav, imageUrl, errorMessage, stage];

  SelectedLocationState copyWith({
    WeatherModel? weatherModel,
    bool? isFav,
    String? imageUrl,
    String? errorMessage,
    SelectedLocationStage? stage,
  }) {
    return SelectedLocationState(
      weatherModel ?? this.weatherModel,
      isFav ?? this.isFav,
      imageUrl ?? this.imageUrl,
      errorMessage ?? this.errorMessage,
      stage ?? this.stage,
    );
  }
}

enum SelectedLocationStage {
  initial,
  weatherReady,
  favChecked,
  addedFav,
  removedFav,
  error,
}
