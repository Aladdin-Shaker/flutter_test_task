import 'package:flutter/material.dart';

SnackBar customAlertSnackbar({
  // requ
  required String msg,
}) {
  return SnackBar(
    content: Text(msg, textScaleFactor: 1),
  );
}
