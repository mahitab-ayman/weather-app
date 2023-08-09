import 'package:flutter/material.dart';
import 'user.dart';
import 'password_page.dart';

class EmailPage extends StatelessWidget {
  final User user;

  EmailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.pink,
        ),
        title: Text('Register', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 2.0,
                  color: Colors.pink,
                ),
                Container(
                  width: 40.0,
                  height: 2.0,
                  color: Colors.pink,
                ),
                Container(
                  width: 40.0,
                  height: 2.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextField(
              onChanged: (value) => user.email = value,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black)),
              style: TextStyle(color: Colors.black),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    if (user.email.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordPage(user: user)),
                      );
                    } else {}
                  },
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
