import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/core/repositories/domain/location_repository.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImplementation extends LocationRepository {
  LocationRepositoryImplementation();

  @override
  Future<Either<Failure, Position>> getCurrentLocalization() async {
    try {
      Position currentPosition = await GeolocatorPlatform.instance
          .getCurrentPosition(forceAndroidLocationManager: true);

      return (Right(currentPosition));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

  @override
  Future<Either<Failure, LocalizationModel>> getAddressFromPosition(
    Position position,
    String localeIdentifier,
  ) async {
    try {
      List<Placemark> list =
          await GeocodingPlatform.instance.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: localeIdentifier,
      );

      LocalizationModel model =
          LocalizationModel.fromJson((list.elementAt(0).toJson()));

      return Right(model);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }
}
