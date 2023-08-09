import 'package:flutter/material.dart';
import 'user.dart';
import 'weather_page.dart';

class CongratulationsPage extends StatelessWidget {
  final User user;
  final String city;

  CongratulationsPage({required this.user, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Congratulations!', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 16),
            Text('Registration successful!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(height: 16),
            Text('Name: ${user.name}',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 8),
            Text('Email: ${user.email}',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherPage(city: city),
                  ),
                );
              },
              child: Text('Check Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
