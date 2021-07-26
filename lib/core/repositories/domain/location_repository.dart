import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentLocalization();

  Future<Either<Failure, LocalizationModel>> getAddressFromPosition(
    Position position,
    String localeIdentifier,
  );
}
