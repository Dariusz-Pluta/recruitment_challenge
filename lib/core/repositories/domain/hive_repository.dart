import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';

abstract class HiveRepository {
  Future<Either<Failure, bool>> addFavorite(LocalizationModel item);

  Future<Either<Failure, bool>> removeFavorite(String city);

  Future<Either<Failure, bool>> isFavorite(LocalizationModel item);

  Future<Either<Failure, Stream<BoxEvent>>> getFavoritesStream();
}
