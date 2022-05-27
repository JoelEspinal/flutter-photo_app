import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' show get;

import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images: images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
