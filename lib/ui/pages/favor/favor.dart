import 'package:flutter/material.dart';
import 'favor_content.dart';

class YSFavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ζηζΆθ'),
      ),
      body: YSFavorContent(),
    );
  }
}
