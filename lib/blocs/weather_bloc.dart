import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/serializers.dart';
import '../models/weather.dart';
import '../services/weather_api.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  final WeatherApi weatherApi;
  final Connectivity _connectivity = Connectivity();

  WeatherBloc(this.weatherApi) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    List<ConnectivityResult> connectivityResult = await _connectivity.checkConnectivity();

    if (!connectivityResult.contains(ConnectivityResult.none)) {
      try {
        List<Weather?> weathers = await weatherApi.fetchWeather(event.latitude, event.longitude);
        List<Weather> nonNullWeathers = weathers.whereType<Weather>().toList();
        emit(WeatherLoaded(nonNullWeathers));
      } catch (exception) {
        emit(WeatherError("Failed to fetch weather data: ${exception.toString()}"));
      }
    } else {
      emit(WeatherError("No internet connection"));
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    try {
      final weatherList = (json['weather'] as List)
          .map((e) => serializers.deserializeWith(Weather.serializer, e))
          .whereType<Weather>()
          .toList();

      return WeatherLoaded(weatherList);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if (state is WeatherLoaded) {
      return {
        'weather': state.weather
            .map((weather) => serializers.serializeWith(Weather.serializer, weather))
            .toList(),
      };
    }
    return null;
  }
}
