import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

final GetIt sl = GetIt.I;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
