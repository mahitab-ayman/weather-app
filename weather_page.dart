import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  final String city;

  WeatherPage({required this.city});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  Future<Weather> fetchWeather() async {
    final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=${widget.city}&units=metric&appid=3d87e152f23d90fb2ea01519f3c48ab6'),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in ${widget.city}'),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Temperature: ${snapshot.data!.temperature.toStringAsFixed(1)}°C',
                            style: TextStyle(fontSize: 24, color: Colors.pink),
                          ),
                          Text(
                            'Condition: ${snapshot.data!.description}',
                            style: TextStyle(fontSize: 24, color: Colors.pink),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Icon(Icons.wb_sunny, size: 60),
                          Text(
                            'Sunrise: ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.sunrise * 1000))}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.nights_stay, size: 60),
                          Text(
                            'Sunset: ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.sunset * 1000))}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
