import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class YSOthersPage extends StatefulWidget {
  @override
  _YSOthersPageState createState() => _YSOthersPageState();
}

class _YSOthersPageState extends State<YSOthersPage> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('原生交互'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('使用三方库调用原生功能', style: Theme.of(context).textTheme.headline2,),
            RaisedButton(
              child: Text('选择照片'),
              onPressed: pickImage
            ),
            _imageFile == null ? Text('请选择一张照片') : Image.file(_imageFile, height: 300,),
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }
}
