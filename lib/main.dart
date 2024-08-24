import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_demo/view/weather_screen.dart';

import 'blocs/weather_bloc.dart';
import 'services/location_service.dart';
import 'services/weather_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize HydratedStorage
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBloc.storage = storage; // Set the storage for HydratedBloc

  WeatherApi weatherApi = WeatherApi();
  LocationService locationService = LocationService();

  var position = await locationService.getCurrentLocation();

  runApp(
    MyApp(
      weatherApi: weatherApi,
      initialPosition: position,
    ),
  );
}

class MyApp extends StatelessWidget {
  final WeatherApi weatherApi;

  final Position initialPosition;

  MyApp({required this.weatherApi, required this.initialPosition});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherApi),
        child:
            WeatherScreen(latitude: initialPosition.latitude, longitude: initialPosition.longitude),
      ),
    );
  }
}
