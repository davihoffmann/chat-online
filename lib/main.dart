import 'package:chat_online/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Online",
      theme: ThemeData(
        primaryColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.lightBlue)
      ),
      home: ChatScreen(),
    );
  }
}
