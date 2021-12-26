import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages {
  static info(BuildContext context, String mensaje) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            backgroundColor: Colors.grey.shade400,
            content: Text(mensaje),
            duration: Duration(milliseconds: 1000),
          ),
        )
        .closed
        .then(
          (value) => Future.delayed(
            const Duration(milliseconds: 100),
            () => Navigator.of(context).pop(),
          ),
        );
  }
}
