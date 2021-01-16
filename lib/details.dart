import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Details extends StatefulWidget {
  final int index;

  Details(this.index);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  File _image;
  final picker = ImagePicker();

  Future gallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No POTHOLE Reported');
      }
    });
    Navigator.pop(context);
  }

  Future camera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No POTHOLE Reported');
      }
    });
    Navigator.pop(context);
  }

  reportpothole(pot) {
    return showDialog(
        context: pot,
        builder: (pot) {
          return SimpleDialog(
            title: Text('Report the pothole'),
            children: [
              SimpleDialogOption(
                child: Text('use camera'),
                onPressed: camera,
              ),
              SimpleDialogOption(
                child: Text('image from gallery'),
                onPressed: gallery,
              )
            ],
          );
        });
  }

  Container splashScreen() {
    return Container(
      color: Colors.lightBlue[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Colors.green[50],
                onPressed: () => reportpothole(context),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                child: Text(
                  'REPORT A POTHOLE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }

  potdes() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            'Description',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: 400,
              height: 400,
              child: Image.file(_image),
            ),
            ListTile(
              title: Container(
                width: 250,
                child: TextField(
                  decoration:
                      InputDecoration(hintText: 'write some Description '),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              title: Container(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'loaction of pothole ',
                      border: InputBorder.none),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _image == null ? splashScreen() : potdes();
  }
}
