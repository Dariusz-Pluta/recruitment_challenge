import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final Map<String, dynamic> mainInfo;
  final List<dynamic> weatherInfo;
  final Map<String, dynamic> windInfo;

  WeatherModel({
    required this.mainInfo,
    required this.weatherInfo,
    required this.windInfo,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      mainInfo: json['main'],
      weatherInfo: json['weather'],
      windInfo: json['wind'],
    );
  }

  @override
  List<Object?> get props => [
        mainInfo,
        weatherInfo,
        windInfo,
      ];
}
