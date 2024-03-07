import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/main.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(weatherModel.weatherCondition),
            getWeatherColor(weatherModel.weatherCondition)[300]!,
            getWeatherColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'updated at ${(weatherModel.date).hour}:${(weatherModel.date).minute}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network('https:${weatherModel.image}'),
                  Text(
                    "${weatherModel.temp.round()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    children: [
                      Text("MaxTemp: ${weatherModel.maxTemp.round()}"),
                      Text("MinTemp: ${weatherModel.minTemp.round()}"),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                weatherModel.weatherCondition,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
