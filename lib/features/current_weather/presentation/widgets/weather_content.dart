import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recruitment_challenge/core/constants/app_assets.dart';
import 'package:recruitment_challenge/core/models/weather_model.dart';
import 'package:recruitment_challenge/core/extensions/string_extension.dart';

import 'app_text.dart';

class WeatherContent extends StatelessWidget {
  final String imageUrl;
  final String tempUnit;
  final String windUnit;
  final WeatherModel weatherModel;

  const WeatherContent({
    Key? key,
    required this.weatherModel,
    required this.imageUrl,
    required this.tempUnit,
    required this.windUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            height: 200.0,
            width: 200.0,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => SizedBox(),
              fit: BoxFit.fill,
            ),
          ),
        ),
        AppText(
          text: '${weatherModel.weatherInfo.first['description']}'.capitalize(),
          fontSize: 35.0,
        ),
        SizedBox(height: 50.0),
        AppText(
          text: '${weatherModel.mainInfo['temp']} $tempUnit',
          fontSize: 35.0,
          color: Colors.white,
        ),
        SizedBox(height: 50.0),
        Container(
          width: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppAssets.pressure,
                    color: Colors.white,
                    height: 20.0,
                    width: 20.0,
                  ),
                  SizedBox(width: 10.0),
                  AppText(text: '${weatherModel.mainInfo['pressure']} hPa'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppAssets.wind,
                      color: Colors.white,
                      height: 20.0,
                      width: 20.0,
                    ),
                    SizedBox(width: 10.0),
                    AppText(
                        text: '${weatherModel.windInfo['speed']} $windUnit'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppAssets.humidity,
                    color: Colors.white,
                    height: 20.0,
                    width: 20.0,
                  ),
                  SizedBox(width: 10.0),
                  AppText(text: '${weatherModel.mainInfo['humidity']} %'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
