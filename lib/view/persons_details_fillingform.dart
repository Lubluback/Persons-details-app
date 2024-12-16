import 'dart:io';
import 'package:flutter/material.dart';
import 'package:persons_details_app/provider/provider.dart';
import 'package:persons_details_app/models/models.dart';
import 'package:persons_details_app/resourses/buttons/buttons.dart';
import 'package:persons_details_app/resourses/custom_textformfield/custom_textformfield.dart';
import 'package:persons_details_app/utils/snackbar.dart';
import 'package:persons_details_app/view/listofpersons_details.dart';
import 'package:provider/provider.dart';

class Fillingtheform extends StatefulWidget {
  const Fillingtheform({
    super.key,
    this.isedit = false,
    this.id,
  });

  final bool isedit;
  final int? id;

  @override
  State<Fillingtheform> createState() => _FillingtheformState();
}

class _FillingtheformState extends State<Fillingtheform> {
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("llllll");
    return SafeArea(
      child: Scaffold(
        body: Consumer<PersonDetailsFillingPrivider>(
            builder: (ctx, value, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      textEditingController: value.namecontroller,
                      labelText: 'fullname',
                      hintFontSize: 15,
                      contentPaddingVertical: 17,
                      boderColor: const Color(0xff4F7B39),
                      borderRadius: 10,
                      val: (val) {
                        final bool name = RegExp('[a-zA-Z]').hasMatch(val!);
                        if (val.trim().isEmpty) {
                          return "required name";
                        } else if (!name) {
                          return 'invalid username';
                        }
                        return null;
                      },
                      focusedboderColor: const Color(0xff4F7B39),
                      readOnly: false,
                      errorColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      textEditingController: value.phonebumbercontroller,
                      inputType: TextInputType.number,
                      labelText: 'phonenumber',
                      hintFontSize: 15,
                      contentPaddingVertical: 17,
                      boderColor: const Color(0xff4F7B39),
                      borderRadius: 10,
                      val: (val) {
                        if (val!.trim().isEmpty) {
                          return "phone is required";
                        } else if (val.length != 10) {
                          return "not valid";
                        }
                        return null;
                      },
                      focusedboderColor: const Color(0xff4F7B39),
                      readOnly: false,
                      errorColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      textEditingController: value.emailcontroller,
                      inputType: TextInputType.name,
                      labelText: 'email',
                      hintFontSize: 15,
                      contentPaddingVertical: 17,
                      boderColor: const Color(0xff4F7B39),
                      borderRadius: 10,
                      val: (val) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!);
                        if (val.trim().isEmpty) {
                          return "email is required";
                        } else if (!emailValid) {
                          return "not valid";
                        }
                        return null;
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
                                  color: const Color(0xff4F7B39), width: 1.2)),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: value.selectedImage.isEmpty
                                ? null
                                : FileImage(File(value.selectedImage)),
                            radius: 70,
                            // child: value.selectedImage == null

                            //     : const Text(
                            //         "Upload image",
                            //         style: TextStyle(color: Colors.black),
                            //       ),
                          ),
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
                                          title: const Text("select type"),
                                          content: Row(
                                            children: [
                                              Expanded(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        value
                                                            .captureImageWithCamera();
                                                      },
                                                      icon: const Icon(
                                                          Icons.camera))),
                                              Expanded(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        value
                                                            .pickImageFromGallery();
                                                      },
                                                      icon: const Icon(
                                                          Icons.collections))),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                )))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Buttons(
                      text: widget.isedit ? "Update" : 'save',
                      onPressed: () async{
                        print("object");

                        if (key.currentState!.validate()) {
                          if (value.selectedImage.isEmpty) {
                            print("uplod img");

                            showCustomSnackbar(context);
                          } else {
                            if (widget.isedit == true) {
                             await value.updateContact(Models(
                                id: widget.id,
                                name: value.namecontroller.text,
                                email: value.emailcontroller.text,
                                phonenumber: value.phonebumbercontroller.text,
                                image: value.selectedImage,
                              ));
                            } else {
                             await value.addContact((Models(
                                id: DateTime.now().millisecondsSinceEpoch,
                                name: value.namecontroller.text,
                                email: value.emailcontroller.text,
                                phonenumber: value.phonebumbercontroller.text,
                                image: value.selectedImage,
                              )));
                            }

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListofpersonsDetails()),
                              (Route<dynamic> route) => false,
                            );
                            value.clearController();
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
