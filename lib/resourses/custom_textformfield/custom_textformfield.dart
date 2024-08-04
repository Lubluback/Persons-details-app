import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


// import 'color.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? val;
  void Function(String)? onChanged;
  void Function(String)? onEditingComplete;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final bool readOnly;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final bool obscureText;
  final Color hintColor;
  void Function()? onTap;
  final int? maxLines;
  final double hintFontSize;
  final TextAlign textAlign;
  final double borderRadius;
  final Color? fillColor;
  final FontWeight? hintFontWeight;
  final Color boderColor;
  final List<TextInputFormatter>? formatter;
  final double contentPaddingVertical;
  final double styleFontSize;
  final Function(String?)? onSaved;
  final Color focusedboderColor;
  final Color? errorColor;
  final bool showCounter;
  final FontWeight? weight;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  BoxConstraints? suffixIconConstraints;

  CustomTextFormField({
    super.key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.hintColor = Colors.black,
    this.suffixIcon,
    this.textEditingController,
    this.inputType,
    this.val,
    this.onChanged,
    this.maxLength,
    required this.readOnly,
    this.obscureText = false,
    this.prefixIcon,
    this.onTap,
    this.maxLines,
    this.hintFontSize = 15,
    this.textAlign = TextAlign.start,
    this.borderRadius = 8.0,
    this.hintFontWeight,
    this.fillColor,
    this.formatter,
    this.boderColor = Colors.grey,
    this.contentPaddingVertical = 15.0,
    this.styleFontSize = 15,
    this.onSaved,
    this.focusedboderColor = const Color(0xff4F7B39),
    this.errorColor = Colors.red,
    this.showCounter = false,
    this.weight,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTap: onTap,
      textAlign: textAlign,
      obscureText: obscureText,
      validator: val,
      initialValue: initialValue,
      controller: textEditingController,
      keyboardType: inputType,
      maxLength: maxLength,
      maxLines: maxLines,
      readOnly: readOnly,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: formatter,
      style: GoogleFonts.openSans(
        fontSize: styleFontSize,
        color: Colors.black,
        fontWeight: weight,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        counterText: showCounter ? null : "",
        counterStyle: const TextStyle(
          height: double.minPositive,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: contentPaddingVertical, horizontal: 12.0),
        hintStyle: GoogleFonts.poppins(
          color: hintColor,
          fontSize: hintFontSize,
          fontWeight: hintFontWeight,
        ),
        labelStyle: GoogleFonts.poppins(
          color: hintColor,
          fontSize: hintFontSize,
          fontWeight: hintFontWeight,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: boderColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: boderColor)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            borderRadius,
          )),
          borderSide: BorderSide(color: focusedboderColor, width: 2),
        ),
      ),
    );
  }
}
