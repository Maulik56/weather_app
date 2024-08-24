import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_demo/blocs/weather_bloc.dart';
import 'package:weather_demo/weather_screen.dart';

void main() {
  late WeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
  });

  testWidgets('WeatherScreen displays shimmer on initial load', (WidgetTester tester) async {
    when(mockWeatherBloc.state).thenReturn(WeatherInitial());
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (_) => mockWeatherBloc,
          child: WeatherScreen(latitude: 0.0, longitude: 0.0),
        ),
      ),
    );

    expect(find.byType(Shimmer), findsOneWidget);
  });

  testWidgets('WeatherScreen displays weather data when loaded', (WidgetTester tester) async {
    when(mockWeatherBloc.state)
        .thenReturn(WeatherLoaded(Weather(temperature: 25, description: 'Sunny')));
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (_) => mockWeatherBloc,
          child: WeatherScreen(latitude: 0.0, longitude: 0.0),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('25°C - Sunny'), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });

  testWidgets('WeatherScreen displays error message on failure', (WidgetTester tester) async {
    when(mockWeatherBloc.state).thenReturn(WeatherError("Failed to fetch weather data"));
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (_) => mockWeatherBloc,
          child: WeatherScreen(latitude: 0.0, longitude: 0.0),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Failed to fetch weather data'), findsOneWidget);
  });
}
