import 'package:chat_online/text_compose.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
        elevation: 0,
      ),
      body: TextCompose(_sendMessage),
    );
  }

  _sendMessage(String text) {
    Firestore.instance.collection("messages").add(
      {
        'text': text,
      }
    );
  }

}