import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtext extends StatelessWidget {
  final String text;
  const Customtext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black));
  }
}
