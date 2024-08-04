import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persons_details_app/controller/getx_controller.dart';
import 'package:persons_details_app/resourses/buttons/buttons.dart';
import 'package:persons_details_app/resourses/customtext/customtext.dart';
import 'package:persons_details_app/view/persons_details_fillingform.dart';

class ListofpersonsDetails extends StatelessWidget {
  ListofpersonsDetails({super.key});
  GetxControllers controller = Get.put(GetxControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff4F7B39),
          onPressed: () {
            Get.to(() => Fillingtheform());
          },
          label: const Text("Add"),
        ),
        body: GetBuilder<GetxControllers>(builder: (controller) {
          return ListView.separated(
              itemCount: controller.datas.length,
              separatorBuilder: (context, index) => const Divider(
                    indent: 0,
                    color: Color(0xff4F7B39),
                  ),
              itemBuilder: (ctx, index) {
                final data = controller.datas[index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Customtext(text: "NAME: ${data.name}"),
                              Customtext(
                                  text: "PHONE NUMBER: ${data.phonenumber}"),
                              Customtext(text: "EMAIL: ${data.email}"),
                              Customtext(
                                  text: "OCCUPATION: ${data.occupation}"),
                              Customtext(text: "CITY: ${data.city}"),
                              Customtext(text: "STATE: ${data.state}"),
                            ]),
                      ),
                      CircleAvatar(
                          radius: 35,
                          backgroundImage: FileImage(File(data.image)))
                    ],
                  ),
                );
              });
        }));
  }
}
