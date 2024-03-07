import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Search a City',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        // backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Search',
                hintText: 'Enter a City'),
          ),
        ),
      ),
    );
  }
}
