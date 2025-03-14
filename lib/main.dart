import 'package:flutter/material.dart';
import 'package:genshin_app/views/character_list_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Genshin App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CharacterListView(),
    );
  }
}
