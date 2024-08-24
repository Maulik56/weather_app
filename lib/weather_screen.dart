import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_demo/blocs/weather_bloc.dart';

import 'services/date_formate.dart';

class WeatherScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  WeatherScreen({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(.8),
        centerTitle: true,
        title: const Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            context.read<WeatherBloc>().add(FetchWeather(latitude, longitude));
            return Center(child: buildShimmerLoading());
          } else if (state is WeatherLoading) {
            return Center(child: buildShimmerLoading());
          } else if (state is WeatherLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                final Connectivity _connectivity = Connectivity();
                List<ConnectivityResult> connectivityResult =
                    await _connectivity.checkConnectivity();

                if (!connectivityResult.contains(ConnectivityResult.none)) {
                  if (context.mounted) {
                    context.read<WeatherBloc>().add(FetchWeather(latitude, longitude));
                  }
                }
                // Trigger a refresh of the weather data
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.weather.length,
                      itemBuilder: (context, index) {
                        final item = state.weather[index];
                        final description = (item.weatherDescriptions.isNotEmpty)
                            ? item.weatherDescriptions.first.description
                            : 'No description available';

                        return Container(
                          height: 70,
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              formatDateTime(item.date ?? 'No date available'),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              '${item.main.temp}°C - $description',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }

  Widget buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[600]!,
      highlightColor: Colors.grey[200]!,
      child: ListView.builder(
        itemCount: 15, // Number of placeholders
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
