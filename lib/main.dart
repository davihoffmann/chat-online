import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  Firestore.instance.collection("col").document("doc").setData({"texto": "davi"});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Online",
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: Container(),
    );
  }
}
