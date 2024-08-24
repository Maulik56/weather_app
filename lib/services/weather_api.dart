import 'package:dio/dio.dart';
import 'package:weather_demo/const/apis.dart';
import 'package:weather_demo/models/serializers.dart';
import 'package:weather_demo/models/weather.dart';

class WeatherApi {
  final Dio _dio = Dio();

  WeatherApi() {
    _dio.options.baseUrl = APIs.baseURL;
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Append the API key and units to every request
      options.queryParameters.addAll({
        'appid': APIs.apiId, // Your actual API key
        'units': 'metric'
      });

      return handler.next(options);
    }, onResponse: (response, handler) {
      // You can also log the response here if needed
      handler.next(response);
    }, onError: (DioError e, handler) {
      // Error handling can be expanded here
      handler.next(e);
    }));
  }

  Future<List<Weather>> fetchWeather(double lat, double lon) async {
    final response = await _dio.get('', queryParameters: {'lat': lat, 'lon': lon});

    if (response.statusCode == 200) {
      List<dynamic> weatherList = response.data['list'];
      var weather = weatherList
          .map((data) => serializers.deserializeWith(Weather.serializer, data))
          .whereType<Weather>() // Filters out nulls and ensures type safety
          .toList();
      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
