import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import 'services/weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(WeatherService()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return _buildInitialInput(context);
          } else if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return _buildColumnWithData(context, state.weatherData);
          } else if (state is WeatherError) {
            return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
          } else {
            return Center(child: Text("Unexpected state!"));
          }
        },
      ),
    );
  }

  Widget _buildInitialInput(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: cityController,
            decoration: InputDecoration(
              labelText: 'Enter city',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<WeatherBloc>().add(GetWeather(cityController.text));
            },
            child: Text('Get Weather'),
            style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnWithData(BuildContext context, dynamic weatherData) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('City: ${weatherData['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('Temperature: ${weatherData['main']['temp']}°C', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text('Weather: ${weatherData['weather'][0]['description']}', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<WeatherBloc>().add(ResetWeather());
            },
            child: Text('Back'),
            style: ElevatedButton.styleFrom(primary: Colors.blueGrey[700]),
          ),
        ],
      ),
    );
  }
}
