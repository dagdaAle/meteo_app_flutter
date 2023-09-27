import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '2a4279a946c0ab3ee26dfb8cbc679164';
  final String baseUrl = "https://api.openweathermap.org/data/2.5";

  Future<dynamic> fetchWeather(String city) async {
    final response = await http.get(Uri.parse("$baseUrl/weather?q=$city&appid=$apiKey"));

    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
      return json.decode(response.body);
    } else {
      print("API Error: ${response.statusCode}");
      throw Exception("Failed to fetch weather data");
    }
  }
}
