import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_application/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          ),
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.orange;
    case "clear":
      return Colors.blue;
    case "partly cloudy":
      return Colors.lightBlue;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.grey;
    case "mist":
      return Colors.grey;
    case "patchy rain possible":
    case "patchy freezing drizzle possible":
    case "light drizzle":
    case "patchy light drizzle":
    case "patchy light rain":
    case "light rain":
    case "light freezing rain":
    case "light sleet":
    case "patchy light snow":
    case "light snow":
    case "light rain shower":
    case "light sleet showers":
    case "light snow showers":
    case "light showers of ice pellets":
    case "patchy light rain with thunder":
    case "patchy light snow with thunder":
      return Colors.lightBlue;
    case "moderate rain at times":
    case "moderate rain":
    case "moderate or heavy freezing rain":
    case "moderate or heavy sleet":
    case "moderate snow":
    case "moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "heavy rain at times":
    case "heavy rain":
    case "heavy freezing drizzle":
    case "heavy snow":
    case "heavy rain shower":
    case "torrential rain shower":
    case "moderate or heavy rain shower":
    case "moderate or heavy sleet showers":
    case "moderate or heavy snow showers":
    case "moderate or heavy snow with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.indigo;
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy moderate snow":
    case "patchy heavy snow":
      return Colors.grey;
    case "thundery outbreaks possible":
    case "blowing snow":
    case "blizzard":
    case "fog":
    case "freezing fog":
    case "ice pellets":
    case "freezing drizzle":
      return Colors.grey;
    default:
      return Colors.blue;
  }
}
