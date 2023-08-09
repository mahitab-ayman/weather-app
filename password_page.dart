import 'package:flutter/material.dart';
import 'user.dart';

import 'location.dart';

class PasswordPage extends StatefulWidget {
  final User user;

  PasswordPage({required this.user});

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    color: Colors.pink,
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
                onChanged: (value) => widget.user.password = value,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.pink,
                      ),
                      onPressed: _togglePasswordVisibility,
                    )),
                obscureText: _obscureText,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                onChanged: (value) => widget.user.confirmPassword = value,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.pink,
                      ),
                      onPressed: _togglePasswordVisibility,
                    )),
                obscureText: _obscureText,
                style: TextStyle(color: Colors.black),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.user.password.isNotEmpty &&
                          widget.user.password == widget.user.confirmPassword) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LocationPage(user: widget.user),
                          ),
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
      ),
    );
  }
}
