import 'package:dio/dio.dart';
import 'package:weather_demo/models/serializers.dart';
import 'package:weather_demo/models/weather.dart';

class WeatherApi {
  final Dio _dio = Dio();

  WeatherApi() {
    _dio.options.baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Append the API key and units to every request
      options.queryParameters.addAll({
        'appid': '37ea9939152496e5de6ca532f93817fd', // Your actual API key
        'units': 'metric'
      });
      // Print the complete URL
      print('Making request to URL: ${options.uri.toString()}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      // You can also log the response here if needed
      handler.next(response);
    }, onError: (DioError e, handler) {
      // Error handling can be expanded here
      print('Request failed: ${e.toString()}');
      handler.next(e);
    }));
  }

  Future<List<Weather>> fetchWeather(double lat, double lon) async {
    final response = await _dio.get('', queryParameters: {'lat': lat, 'lon': lon});
    print(':::::::RSPONSE::${response.data}');
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
