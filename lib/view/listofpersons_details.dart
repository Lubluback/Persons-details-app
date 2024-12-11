import 'dart:io';

import 'package:flutter/material.dart';

import 'package:persons_details_app/provider/provider.dart';

import 'package:persons_details_app/resourses/customtext/customtext.dart';
import 'package:persons_details_app/view/persons_details_fillingform.dart';
import 'package:provider/provider.dart';

class ListofpersonsDetails extends StatefulWidget {
  const ListofpersonsDetails({super.key});

  @override
  State<ListofpersonsDetails> createState() => _ListofpersonsDetailsState();
}

class _ListofpersonsDetailsState extends State<ListofpersonsDetails> {
  @override
  void initState() {
    final providerdata =
        Provider.of<PersonDetailsFillingPrivider>(context, listen: false);

    providerdata.loadContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff4F7B39),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Fillingtheform()));
          },
          label: const Text("Add"),
        ),
        body: Consumer<PersonDetailsFillingPrivider>(
            builder: (ctx, value, child) {
          return ListView.separated(
              itemCount: value.data.length,
              separatorBuilder: (context, index) => const Divider(
                    indent: 0,
                    color: Color(0xff4F7B39),
                  ),
              itemBuilder: (ctx, index) {
                final data = value.data[index];
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
                              // Customtext(
                              //     text: "OCCUPATION: ${data.occupation}"),
                              // Customtext(text: "CITY: ${data.country}"),
                              // Customtext(text: "STATE: ${data.state}"),
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
