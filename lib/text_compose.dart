import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextCompose extends StatefulWidget {
  final Function({String text, File file}) sendMessage;

  TextCompose(this.sendMessage);

  @override
  _TextComposeState createState() => _TextComposeState();
}

class _TextComposeState extends State<TextCompose> {
  bool _isComposing = false;

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: _onClickTirarFoto,
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                _sendMessage(text);
              },
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposing
                  ? () => _sendMessage(_textController.text)
                  : null)
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    widget.sendMessage(text: text);
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  void _onClickTirarFoto() async {
    final File imgFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(imgFile == null) {
      return;
    }
    widget.sendMessage(file: imgFile);
  }
}
