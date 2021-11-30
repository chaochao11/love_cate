import 'package:flutter/material.dart';
import 'dou_ban_content.dart';

class YSDouBanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('豆瓣电影'),
      ),
      body: YSDouBanContent(),
    );;
  }
}
