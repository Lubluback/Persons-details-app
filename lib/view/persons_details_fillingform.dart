import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persons_details_app/resourses/buttons/buttons.dart';
import 'package:persons_details_app/resourses/custom_textformfield/custom_textformfield.dart';

class Fillingtheform extends StatefulWidget {
  const Fillingtheform({super.key});

  @override
  State<Fillingtheform> createState() => _FillingtheformState();
}

class _FillingtheformState extends State<Fillingtheform> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phonebumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _occupation = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  textEditingController: _name,
                  inputType: TextInputType.name,
                  labelText: 'fullname'.tr,
                  hintFontSize: 15,
                  contentPaddingVertical: 17,
                  boderColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  val: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  focusedboderColor: const Color(0xff4F7B39),
                  readOnly: false,
                  errorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textEditingController: _phonebumber,
                  inputType: TextInputType.name,
                  labelText: 'phonenumber'.tr,
                  hintFontSize: 15,
                  contentPaddingVertical: 17,
                  boderColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  val: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  focusedboderColor: const Color(0xff4F7B39),
                  readOnly: false,
                  errorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textEditingController: _email,
                  inputType: TextInputType.name,
                  labelText: 'email'.tr,
                  hintFontSize: 15,
                  contentPaddingVertical: 17,
                  boderColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  val: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  focusedboderColor: const Color(0xff4F7B39),
                  readOnly: false,
                  errorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textEditingController: _occupation,
                  inputType: TextInputType.name,
                  labelText: 'occupation'.tr,
                  hintFontSize: 15,
                  contentPaddingVertical: 17,
                  boderColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  val: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  focusedboderColor: const Color(0xff4F7B39),
                  readOnly: false,
                  errorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textEditingController: _city,
                  inputType: TextInputType.none,
                  labelText: 'city'.tr,
                  hintFontSize: 15,
                  contentPaddingVertical: 17,
                  boderColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  val: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  focusedboderColor: const Color(0xff4F7B39),
                  readOnly: false,
                  errorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textEditingController: _state,
                  inputType: TextInputType.none,
                  labelText: 'state',
                  hintFontSize: 15,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                  contentPaddingVertical: 17,
                  boderColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  val: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  focusedboderColor: const Color(0xff4F7B39),
                  readOnly: false,
                  errorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                Buttons(
                  text: 'save'.tr,
                  onPressed: () {
                    // if (_key.currentState!.validate()) {}
                   
                    
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
