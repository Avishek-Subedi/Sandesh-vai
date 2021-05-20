import 'package:flutter/material.dart';
import 'widgets/image_list.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
      appBar: AppBar(title: Text("Sandesh vaiiiiii")),
      body: Container(
        child: ImageList(images),
      ),
    );
  }
}
