import 'package:flutter/material.dart';

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('About  H Y M N +'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        _buildAboutText(),
//        _buildLogoAttribution(),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Okay, got it!'),
      ),
    ],
  );
}
