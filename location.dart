import 'package:flutter/material.dart';
import 'user.dart';
import 'congratulations_page.dart';

class LocationPage extends StatefulWidget {
  final User user;

  LocationPage({required this.user});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String dropdownValueCountry = 'Select Country';
  String dropdownValueCity = 'Select City';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register', style: TextStyle(color: Colors.pink)),
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValueCountry,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueCountry = newValue!;
                    });
                  },
                  items: <String>['Select Country', 'EGYPT', 'usa', 'france']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValueCity,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueCity = newValue!;
                    });
                  },
                  items: <String>['Select City', 'cairo', 'alexandria', 'aswan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (dropdownValueCity != 'Select City') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CongratulationsPage(
                              user: widget.user, city: dropdownValueCity),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select a city'),
                        ),
                      );
                    }
                  },
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
