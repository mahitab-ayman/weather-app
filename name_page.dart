import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'user.dart';
import 'email_page.dart';

class NamePage extends StatefulWidget {
  final User user;

  NamePage({required this.user});

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        widget.user.photo = pickedFile.path;
      }
    });
  }

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
                  color: Colors.black,
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
              onChanged: (value) => widget.user.name = value,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black)),
              style: TextStyle(color: Colors.black),
            ),
            Stack(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 70,
                  backgroundImage: widget.user.photo != null
                      ? FileImage(File(widget.user.photo!))
                      : null,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, size: 50),
                    onPressed: getImage,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.user.name.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailPage(user: widget.user)),
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
