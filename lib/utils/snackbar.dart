import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text('Uplode image'),
      action: SnackBarAction(
        label: 'Error',
        onPressed: () {},
      ),
    );

    // Show the SnackBar
  }
}

showCustomSnackbar(context) {
  final snackBar = const SnackBar(
    content: Text('Uplode image'),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
