import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AdaptativeButton(
      {required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: () => onPressed,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(onPressed: () => onPressed(), child: Text(label));
  }
}
