import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:persons_details_app/controller/getx_controller.dart';
import 'package:persons_details_app/resourses/buttons/buttons.dart';
import 'package:persons_details_app/resourses/custom_textformfield/custom_textformfield.dart';
import 'package:persons_details_app/utils/snackbar.dart';

class Fillingtheform extends StatefulWidget {
  const Fillingtheform({super.key});

  @override
  State<Fillingtheform> createState() => _FillingtheformState();
}

class _FillingtheformState extends State<Fillingtheform> {
  GetxControllers controller = Get.put(GetxControllers());

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("object");
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    textEditingController: controller.namecontroller,
                    // inputType: TextInputType.text,
                    labelText: 'fullname',
                    hintFontSize: 15,
                    contentPaddingVertical: 17,
                    boderColor: const Color(0xff4F7B39),
                    borderRadius: 10,
                    val: (value) {
                      if (value == null || value.isEmpty) {
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
                    textEditingController: controller.phonebumbercontroller,
                    inputType: TextInputType.number,
                    labelText: 'phonenumber',
                    hintFontSize: 15,
                    contentPaddingVertical: 17,
                    boderColor: const Color(0xff4F7B39),
                    borderRadius: 10,
                    val: (value) {
                      if (value == null || value.isEmpty) {
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
                    textEditingController: controller.emailcontroller,
                    inputType: TextInputType.name,
                    labelText: 'email',
                    hintFontSize: 15,
                    contentPaddingVertical: 17,
                    boderColor: const Color(0xff4F7B39),
                    borderRadius: 10,
                    val: (value) {
                      if (value == null || value.isEmpty) {
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
                    textEditingController: controller.occupationcontroller,
                    inputType: TextInputType.name,
                    labelText: 'occupation',
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
                    textEditingController: controller.citycontroller,
                    inputType: TextInputType.none,
                    labelText: 'city',
                    hintFontSize: 15,
                    contentPaddingVertical: 17,
                    boderColor: const Color(0xff4F7B39),
                    borderRadius: 10,
                    val: (value) {
                      if (value == null || value.isEmpty) {
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
                    onChanged: (val) {
                      print(val);
                      controller.updateState(val);
                    },
                    //textEditingController: controller.statecontroller,
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
                      if (value == null || value.isEmpty) {
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
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(0xff4F7B39), width: 1.2)),
                        child:
                            GetBuilder<GetxControllers>(builder: (controller1) {
                          return CircleAvatar(
                            child: controller.img.isNotEmpty
                                ? null
                                : Text(
                                    "Upload image",
                                    style: TextStyle(color: Colors.black),
                                  ),
                            backgroundColor: Colors.grey,
                            backgroundImage: controller.img.isEmpty
                                ? null
                                : FileImage(File(controller.img)),
                            radius: 70,
                          );
                        }),
                      ),
                      Positioned(
                          top: 103,
                          left: 85,
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (
                                      ctx,
                                    ) {
                                      return AlertDialog(
                                        title: Text("select type"),
                                        content: Row(
                                          children: [
                                            Expanded(
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      controller.imagePickers(
                                                          ImageSource.camera);
                                                    },
                                                    icon: Icon(Icons.camera))),
                                            Expanded(
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      controller.imagePickers(
                                                          ImageSource.gallery);
                                                    },
                                                    icon: Icon(
                                                        Icons.collections))),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.add,
                                size: 30,
                              )))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Buttons(
                    text: 'save',
                    onPressed: () {
                      print("object");
                      if (key.currentState!.validate()) {
                        if (controller.img.isEmpty) {
                          print("uplod img");
                          Utils.snackbars("error", "uplode your photo");
                        } else {
                          controller.submit();
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
