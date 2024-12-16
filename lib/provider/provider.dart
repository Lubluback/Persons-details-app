import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:persons_details_app/database/sqflite.dart';
import 'package:persons_details_app/models/models.dart';

class PersonDetailsFillingPrivider extends ChangeNotifier {
  String _selectedImage = '';

  String get selectedImage => _selectedImage;
  final namecontroller = TextEditingController();
  final phonebumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<Models> _data = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Models> get data => _data;

  Future<void> loadContacts() async {
    final data = await _dbHelper.fetchContacts();
    _data = data.map((item) => Models.fromMap(item)).toList();
    notifyListeners();
  }

  Future<void> addContact(Models contact) async {
    await _dbHelper.insertContact(contact.toMap());
    await loadContacts();
  }

  Future<void> updateContact(Models contact) async {
    if (contact.id != null) {
      await _dbHelper.updateContact(contact.id!, contact.toMap());
      await loadContacts();
    }
  }
  

  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    await loadContacts();
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage = pickedFile.path;
    } else {
      print("No image selected.");
    }
    notifyListeners();
  }

  // Capture an image using the camera
  Future<void> captureImageWithCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    log("${pickedFile?.path}");

    if (pickedFile != null) {
      _selectedImage = pickedFile.path;
    } else {
      print("No image captured.");
    }
    notifyListeners();
  }

  //clear controller
  clearController() {
    namecontroller.clear();
    emailcontroller.clear();
    phonebumbercontroller.clear();
    _selectedImage = '';
    notifyListeners();
  }

  passingController(Models model) {
    namecontroller.text = model.name;
    phonebumbercontroller.text = model.phonenumber;
    emailcontroller.text = model.email;
    _selectedImage = model.image;
    notifyListeners();
  }
}
