import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:persons_details_app/resourses/buttons/buttons.dart';

class SelectLang extends StatelessWidget {
  SelectLang({super.key});

  final List locate = [
    {
      'name': 'English',
      'locale': const Locale('en', 'US'),
    },
    {'name': 'മലയാളം', 'locale': const Locale('ml', 'IN')}
  ];
  buildDialogue(context) {
    showDialog(
        context: context,
        builder: (builder) {
          return Container(
            height: 100,
            child: AlertDialog(
              title: Center(child: Text("Choose the language")),
              content: InkWell(
                onTap: () {
                  Get.back();
                },
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctx, index) {
                      return Center(child: Text(locate[index]['name']));
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: locate.length),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Buttons(
          text: 'Choose a language',
          onPressed: () {
            buildDialogue(context);
          }),
    ));
  }
}
