import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buttons extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Buttons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xff4F7B39),
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontStyle: FontStyle.normal),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
