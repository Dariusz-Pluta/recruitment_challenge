// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/other_locations/data/repositories/other_localizations_repository_impl.dart'
    as _i8;
import '../../features/other_locations/domain/repositories/other_locations_repository.dart'
    as _i7;
import '../repositories/data/hive_repository_impl.dart' as _i4;
import '../repositories/data/location_repository_impl.dart' as _i6;
import '../repositories/domain/hive_repository.dart' as _i3;
import '../repositories/domain/location_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HiveRepository>(() => _i4.HiveRepositoryImplementation());
  gh.factory<_i5.LocationRepository>(
      () => _i6.LocationRepositoryImplementation());
  gh.factory<_i7.OtherLocalizationsRepository>(
      () => _i8.OtherLocalizationsRepositoryImplementation());
  return get;
}
