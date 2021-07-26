part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  final List<LocalizationModel> favoritesList;
  final String errorMessage;
  final FavoritesStage stage;

  const FavoritesState(
    this.favoritesList,
    this.errorMessage,
    this.stage,
  );

  List<LocalizationModel> get favorites => favoritesList;

  bool get initial => stage == FavoritesStage.initial;
  bool get favoritesChanged => stage == FavoritesStage.favoritesChanged;
  bool get error => stage == FavoritesStage.error;

  FavoritesState setStateToFavoritesChanged(
    List<LocalizationModel> list,
  ) =>
      copyWith(
        favoritesList: list,
        stage: FavoritesStage.favoritesChanged,
      );

  FavoritesState setStateToError(String errorMessage) => copyWith(
        errorMessage: errorMessage,
        stage: FavoritesStage.error,
      );

  @override
  List<Object> get props => [favoritesList, errorMessage, stage];

  FavoritesState copyWith({
    List<LocalizationModel>? favoritesList,
    String? imageUrl,
    String? errorMessage,
    FavoritesStage? stage,
  }) {
    return FavoritesState(
      favoritesList ?? this.favoritesList,
      errorMessage ?? this.errorMessage,
      stage ?? this.stage,
    );
  }
}

enum FavoritesStage {
  initial,
  favoritesChanged,
  error,
}
