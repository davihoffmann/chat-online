import 'dart:io';

import 'package:chat_online/text_compose.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  _sendMessage({String text, File file}) async {

    Map<String, dynamic> data = {};

    if(file != null) {
      StorageUploadTask task = FirebaseStorage.instance.ref().child(
        DateTime.now().millisecondsSinceEpoch.toString()
      ).putFile(file);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      print(url);
      data['imgUrl'] = url;
    }

    if(text != null) {
      data['text'] = text;
    }

    Firestore.instance.collection("messages").add(data);
  }

}