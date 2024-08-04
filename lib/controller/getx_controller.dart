import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persons_details_app/models/models.dart';
import 'package:persons_details_app/view/listofpersons_details.dart';

class GetxControllers extends GetxController {
  List<Models> datas = [];

  final image = ImagePicker();
  final namecontroller = TextEditingController();
  final phonebumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final occupationcontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();

  // RxString name = ''.obs;
  // RxString phonenumber = ''.obs;
  // RxString email = ''.obs;
  // RxString occupation = ''.obs;
  // RxString city = ''.obs;
  // RxString state = ''.obs;
  // RxString img = ''.obs;
  String img = '';

  void submit() {
    print("click");

    datas.add(Models(
      name: namecontroller.text,
      phonenumber: phonebumbercontroller.text,
      email: emailcontroller.text,
      occupation: occupationcontroller.text,
      city: citycontroller.text,
      state: statecontroller.text,
      image: img,
    ));
    update();
    print(datas[0].name);
    print(datas[0].phonenumber);
    print(datas[0].email);
    print(datas[0].occupation);
    print(datas[0].city);
    print(datas[0].state);
    print(datas[0].image);

    //Get.to(() => ListofpersonsDetails());
    Get.back();
    clearAllData();
  }

  Future<void> imagePickers(ImageSource imagesource) async {
    final cam = await image.pickImage(source: imagesource);
    if (cam != null) {
      final takenimg = File(cam.path);
      img = takenimg.path;
    }
    update();
  }

  clearAllData() {
    namecontroller.clear();
    phonebumbercontroller.clear();
    emailcontroller.clear();
    occupationcontroller.clear();
    citycontroller.clear();
    statecontroller.clear();
    img = '';
    update();
  }

  updateState(val) {
    statecontroller.text = val;
    update();
  }
}
