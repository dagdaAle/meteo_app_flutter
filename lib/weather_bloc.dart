import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import 'services/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weatherData = await weatherService.fetchWeather(event.city);
        emit(WeatherLoaded(weatherData));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });

    // Aggiungi questo gestore per l'evento ResetWeather
    on<ResetWeather>((event, emit) {
      emit(WeatherInitial());
    });
  }
}
