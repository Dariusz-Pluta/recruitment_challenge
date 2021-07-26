import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/features/other_locations/domain/repositories/other_locations_repository.dart';

@Injectable(as: OtherLocalizationsRepository)
class OtherLocalizationsRepositoryImplementation
    extends OtherLocalizationsRepository {
  @override
  Future<Either<Failure, List<LocalizationModel>>>
      loadLocalizationsFromJSON() async {
    try {
      var localizations =
          await rootBundle.loadString('data/localization_list.json');
      var _localizationsJson = json.decode(localizations);
      List<LocalizationModel> localizationsList = [];

      for (var localization in _localizationsJson) {
        localizationsList.add(LocalizationModel.fromJson(localization));
      }
      return Right(localizationsList);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }
}
