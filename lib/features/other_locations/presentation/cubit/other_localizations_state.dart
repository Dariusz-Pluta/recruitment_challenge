part of 'other_localizations_cubit.dart';

class OtherLocalizationsState extends Equatable {
  final List<LocalizationModel> list;
  final List<LocalizationModel> searchResult;
  final String errorMessage;
  final OtherLocalizationsStage stage;

  const OtherLocalizationsState(
    this.list,
    this.searchResult,
    this.errorMessage,
    this.stage,
  );

  List<LocalizationModel> get localizations => list;
  List<LocalizationModel> get result => searchResult;

  bool get initial => stage == OtherLocalizationsStage.initial;
  bool get listReady => stage == OtherLocalizationsStage.listReady;
  bool get searchResultReady =>
      stage == OtherLocalizationsStage.searchResultReady;
  bool get error => stage == OtherLocalizationsStage.error;

  OtherLocalizationsState setStateToListReady(List<LocalizationModel> list) =>
      copyWith(
        list: list,
        stage: OtherLocalizationsStage.listReady,
      );

  OtherLocalizationsState setStateToSearchResultReady(
    List<LocalizationModel> searchResult,
  ) =>
      copyWith(
        searchResult: searchResult,
        stage: OtherLocalizationsStage.searchResultReady,
      );

  OtherLocalizationsState setStateToError(String errorMessage) => copyWith(
        errorMessage: errorMessage,
        stage: OtherLocalizationsStage.error,
      );

  @override
  List<Object> get props => [list, searchResult, errorMessage, stage];

  OtherLocalizationsState copyWith({
    List<LocalizationModel>? list,
    List<LocalizationModel>? searchResult,
    String? errorMessage,
    OtherLocalizationsStage? stage,
  }) {
    return OtherLocalizationsState(
      list ?? this.list,
      searchResult ?? this.searchResult,
      errorMessage ?? this.errorMessage,
      stage ?? this.stage,
    );
  }
}

enum OtherLocalizationsStage {
  initial,
  listReady,
  searchResultReady,
  error,
}
