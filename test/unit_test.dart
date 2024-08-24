import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_demo/blocs/weather_bloc.dart';
import 'package:weather_demo/services/weather_api.dart';

class MockWeatherApi extends Mock implements WeatherApi {}

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  group('WeatherBloc Tests', () {
    late WeatherApi weatherApi;
    late Connectivity connectivity;
    late WeatherBloc weatherBloc;

    setUp(() {
      weatherApi = MockWeatherApi();
      connectivity = MockConnectivity();
      weatherBloc = WeatherBloc(weatherApi, connectivity);
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading, WeatherLoaded] when successful',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(FetchWeather(latitude: 0.0, longitude: 0.0)),
      setUp: () {
        when(connectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
        when(weatherApi.fetchWeather(any, any))
            .thenAnswer((_) async => Weather(temperature: 25, description: 'Sunny'));
      },
      expect: () =>
          [WeatherLoading(), WeatherLoaded(Weather(temperature: 25, description: 'Sunny'))],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading, WeatherError] when API fails',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(FetchWeather(latitude: 0.0, longitude: 0.0)),
      setUp: () {
        when(connectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
        when(weatherApi.fetchWeather(any, any)).thenThrow(NetworkException());
      },
      expect: () => [WeatherLoading(), WeatherError("Failed to fetch weather data")],
    );
  });
}
