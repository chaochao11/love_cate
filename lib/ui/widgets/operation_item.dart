import 'package:flutter/material.dart';

class YSOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final VoidCallback _onPress;

  YSOperationItem(this._icon, this._title, this._onPress);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: _icon,
      label: Text(_title),
      onPressed: _onPress
    );
  }
}
