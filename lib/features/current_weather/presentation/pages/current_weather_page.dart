import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment_challenge/core/dependency_injection/di.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/error_snackbar.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/localization_content.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/weather_content.dart';
import 'package:recruitment_challenge/features/unit/presentation/cubit/unit_cubit.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  late CurrentWeatherCubit _cubit;

  late Widget _weatherContent;
  late Widget _addressContent;

  @override
  void initState() {
    super.initState();

    _addressContent = SizedBox();
    _weatherContent = Center(
      child: CircularProgressIndicator(color: Colors.amber),
    );

    _cubit = CurrentWeatherCubit(sl());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit.getPosition(context);

    _cubit.stream.listen((state) {
      if (state.addressReady) {
        _cubit.getCurrentWeather(
          state.address.city!,
          BlocProvider.of<UnitCubit>(context).state.getUnitCall,
          Localizations.localeOf(context).languageCode,
        );

        _addressContent = LocalizationContent(
          address: state.address.toString(),
        );
      } else if (state.weatherReady) {
        _weatherContent = WeatherContent(
          weatherModel: state.weatherModel,
          imageUrl: state.imageUrl,
          tempUnit: BlocProvider.of<UnitCubit>(context).state.tempUnit,
          windUnit: BlocProvider.of<UnitCubit>(context).state.windUnit,
        );
      } else if (state.error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(context: context, text: state.errorMessage),
        );
      }
    });

    BlocProvider.of<UnitCubit>(context).stream.listen((state) {
      if (state.changed) {
        _cubit.getCurrentWeather(
          _cubit.state.hiveFavoriteModel.city!,
          state.getUnitCall,
          Localizations.localeOf(context).languageCode,
        );
      } else if (state.error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(context: context, text: state.errorMessage),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        bloc: _cubit,
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25.0),
                _weatherContent,
                Expanded(child: SizedBox()),
                _addressContent,
                const SizedBox(height: 25.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
