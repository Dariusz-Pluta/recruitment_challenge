import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/features/other_locations/presentation/cubit/other_localizations_cubit.dart';
import 'package:recruitment_challenge/features/unit/presentation/cubit/unit_cubit.dart';
import 'package:recruitment_challenge/generated/l10n.dart';

import 'core/dependency_injection/di.dart';
import 'features/main_page/presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final Directory directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(LocalizationModelAdapter());
  await Hive.openBox<LocalizationModel>('favorites');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UnitCubit>(
          create: (context) => UnitCubit(),
        ),
        BlocProvider<OtherLocalizationsCubit>(
          create: (context) => OtherLocalizationsCubit(sl()),
        ),
      ],
      child: MaterialApp(
        title: 'Weather app',
        localizationsDelegates: [
          Strings.delegate,
          ...GlobalMaterialLocalizations.delegates
        ],
        supportedLocales: Strings.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}
