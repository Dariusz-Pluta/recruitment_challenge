import 'package:dartz/dartz.dart';
import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';

abstract class OtherLocalizationsRepository {
  Future<Either<Failure, List<LocalizationModel>>> loadLocalizationsFromJSON();
}
