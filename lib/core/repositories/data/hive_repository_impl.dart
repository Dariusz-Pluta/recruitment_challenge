import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/core/repositories/domain/hive_repository.dart';

@Injectable(as: HiveRepository)
class HiveRepositoryImplementation implements HiveRepository {
  @override
  Future<Either<Failure, bool>> addFavorite(LocalizationModel item) async {
    try {
      LocalizationModel value = LocalizationModel(
        city: item.city,
        country: item.country,
      );
      Hive.box<LocalizationModel>('favorites').put(value.city, value);
      return Right(true);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

  @override
  Future<Either<Failure, Stream<BoxEvent>>> getFavoritesStream() async {
    try {
      return Right(Hive.box<LocalizationModel>('favorites').watch());
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavorite(String city) async {
    try {
      Hive.box<LocalizationModel>('favorites').delete(city);
      return Right(true);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(LocalizationModel item) async {
    try {
      if (Hive.box<LocalizationModel>('favorites').containsKey(item.city)) {
        return Right(true);
      } else
        return Right(false);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }
}
