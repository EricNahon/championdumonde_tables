import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar({
    required BuildContext context,
    required Widget content,
    SnackBarAction? snackBarAction,
    Color backgroundColor = Colors.black54,
  }) {
    final SnackBar snackBar = SnackBar(action: snackBarAction, backgroundColor: backgroundColor, content: content, behavior: SnackBarBehavior.floating);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
