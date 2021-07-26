import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/core/repositories/domain/hive_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final HiveRepository _repository;
  FavoritesCubit(this._repository)
      : super(FavoritesState(
          Hive.box<LocalizationModel>('favorites').values.toList(),
          '',
          FavoritesStage.initial,
        ));

  void listenToFavoritesChange() async {
    final result = await _repository.getFavoritesStream();

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (stream) => stream.listen((_) => emit(state.setStateToFavoritesChanged(
          Hive.box<LocalizationModel>('favorites').values.toList()))),
    );
  }

  void delete(String city) async {
    final result = await _repository.removeFavorite(city);

    result.fold(
      (error) => emit(state.setStateToError('$error')),
      (_) => emit(state.setStateToFavoritesChanged(state.favoritesList)),
    );
  }
}
