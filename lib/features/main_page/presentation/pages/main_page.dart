import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:recruitment_challenge/core/constants/app_assets.dart';
import 'package:recruitment_challenge/core/constants/app_colors.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/pages/current_weather_page.dart';
import 'package:recruitment_challenge/features/favorites/presentation/pages/favorites_page.dart';
import 'package:recruitment_challenge/features/other_locations/presentation/pages/other_locations_page.dart';
import 'package:recruitment_challenge/features/unit/presentation/cubit/unit_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;
  late final List<Widget> _children;

  @override
  void initState() {
    super.initState();

    _currentIndex = 1;
    _children = [OtherLocationsPage(), CurrentWeatherPage(), FavoritesPage()];
  }

  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
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
            child: IndexedStack(
              index: _currentIndex,
              children: _children,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: onTabPressed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
        ],
      ),
    );
  }
}
