// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WeatherApi implements WeatherApi {
  _WeatherApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.openweathermap.org';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Either<Failure, WeatherModel>> getWeather(city, unit, lang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    try {
      final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
          Either<Failure, WeatherModel>>(Options(
              method: 'GET', headers: <String, dynamic>{}, extra: _extra)
          .compose(_dio.options,
              '/data/2.5/weather?q=$city&units=$unit&lang=$lang&appid=968396b2fb8f3a96cd7171b09d33ae62',
              queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      final value = WeatherModel.fromJson(_result.data!);
      return Right(value);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
