import 'dart:developer';

import 'package:weather_application/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '74720a19c2724abb935151903230703';
  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "Ooops, There is an Error , Try Later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Ooops, There is an Error , Try Later");
    }
  }
}
