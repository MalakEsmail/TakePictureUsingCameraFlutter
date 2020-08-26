import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Image Picker ",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Center(
          child:
              _image == null ? Text('No Image Selected') : Image.file(_image),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
