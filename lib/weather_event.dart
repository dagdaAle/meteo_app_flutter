abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String city;

  GetWeather(this.city);
}

class ResetWeather extends WeatherEvent {}

