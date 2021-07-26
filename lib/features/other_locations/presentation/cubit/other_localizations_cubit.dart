import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/features/other_locations/domain/repositories/other_locations_repository.dart';

part 'other_localizations_state.dart';

class OtherLocalizationsCubit extends Cubit<OtherLocalizationsState> {
  final OtherLocalizationsRepository _otherLocalizationsRepository;

  OtherLocalizationsCubit(this._otherLocalizationsRepository)
      : super(OtherLocalizationsState(
          [],
          [],
          '',
          OtherLocalizationsStage.initial,
        ));

  void getLocalizationsList() async {
    final result =
        await _otherLocalizationsRepository.loadLocalizationsFromJSON();

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (list) => emit(state.setStateToListReady(list)),
    );
  }

  void search(String query) async {
    if (query.isEmpty) {
      emit(state.setStateToListReady(state.list));
    } else {
      List<LocalizationModel> temp = [];

      state.list.forEach(
        (element) {
          if (element.city
              .toString()
              .toLowerCase()
              .startsWith(query.toLowerCase())) {
            temp.add(element);
          }
        },
      );

      emit(state.setStateToSearchResultReady(temp));
    }
  }
}
