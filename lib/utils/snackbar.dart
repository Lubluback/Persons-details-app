import 'package:flutter/material.dart';

showCustomSnackbar(context) {
  const snackBar = SnackBar(
    content: Text('Uplode image'),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
