// lib/blocs/weather_event.dart
part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final double latitude;
  final double longitude;

  FetchWeather(this.latitude, this.longitude);
}
