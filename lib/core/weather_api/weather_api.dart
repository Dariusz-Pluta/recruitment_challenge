import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recruitment_challenge/core/failures/failure.dart';
import 'package:recruitment_challenge/core/models/weather_model.dart';
import 'package:retrofit/http.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org")
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET(
      '/data/2.5/weather?q={city}&units={unit}&lang={lang}&appid=968396b2fb8f3a96cd7171b09d33ae62')
  Future<Either<Failure, WeatherModel>> getWeather(
    @Path('city') String city,
    @Path('unit') String unit,
    @Path('lang') String lang,
  );
}
