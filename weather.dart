class Weather {
  final String description;
  final double temperature;
  final int sunrise;
  final int sunset;

  Weather({
    required this.description,
    required this.temperature,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
