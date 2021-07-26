import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:recruitment_challenge/core/constants/app_assets.dart';
import 'package:recruitment_challenge/core/constants/app_colors.dart';
import 'package:recruitment_challenge/core/dependency_injection/di.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/error_snackbar.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/localization_content.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/weather_content.dart';
import 'package:recruitment_challenge/features/selected_location/presentation/cubit/selected_location_cubit.dart';
import 'package:recruitment_challenge/features/unit/presentation/cubit/unit_cubit.dart';

class SelectedLocationPage extends StatefulWidget {
  final LocalizationModel model;
  const SelectedLocationPage({Key? key, required this.model}) : super(key: key);

  @override
  _SelectedLocationPageState createState() => _SelectedLocationPageState();
}

class _SelectedLocationPageState extends State<SelectedLocationPage> {
  late SelectedLocationCubit _cubit;

  late Widget _weatherContent;
  late Widget _addressContent;

  @override
  void initState() {
    super.initState();

    _weatherContent = Center(
      child: CircularProgressIndicator(color: Colors.amber),
    );

    _addressContent = LocalizationContent(
      address: '${widget.model.city}, ${widget.model.country}',
    );

    _cubit = SelectedLocationCubit(sl());

    _cubit.isFavorite(widget.model);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _cubit.getCurrentWeather(
      widget.model.city!,
      BlocProvider.of<UnitCubit>(context).state.getUnitCall,
      Localizations.localeOf(context).languageCode,
    );

    _cubit.stream.listen((state) {
      if (state.weatherReady) {
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
          widget.model.city!,
          state.unitCall,
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leading: BlocBuilder<UnitCubit, UnitState>(
          bloc: BlocProvider.of<UnitCubit>(context),
          builder: (context, state) => FlutterSwitch(
            value: state.getIsFarenheitBool,
            onToggle: (val) => BlocProvider.of<UnitCubit>(context).change(val),
            activeText: '°F',
            inactiveText: '°C',
            inactiveTextColor: Colors.amber,
            activeTextColor: Colors.amber,
            showOnOff: true,
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
        ),
        actions: [
          BlocBuilder<SelectedLocationCubit, SelectedLocationState>(
            bloc: _cubit,
            builder: (context, state) {
              return IconButton(
                onPressed: () => state.isFav
                    ? _cubit.removeFromFavorites(widget.model)
                    : _cubit.addToFavorite(widget.model),
                icon: state.isFav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.amber,
                      )
                    : Icon(Icons.favorite_border),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: AppColors.gradient,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<SelectedLocationCubit, SelectedLocationState>(
                bloc: _cubit,
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 25.0),
                        _weatherContent,
                        Expanded(child: SizedBox()),
                        _addressContent,
                        SizedBox(height: 25.0),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
