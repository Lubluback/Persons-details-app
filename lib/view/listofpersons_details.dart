import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            Provider.of<PersonDetailsFillingPrivider>(context, listen: false)
                .clearController();
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const Fillingtheform()));
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
                return Slidable(
                  key: Key("${data.id}"),
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (ctx) {
                        value.deleteContact(data.id!);
                      },
                      backgroundColor: const Color(0xff4F7B39),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    )
                  ]),
                  child: Padding(
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
                        Column(
                          children: [
                            CircleAvatar(
                                radius: 35,
                                backgroundImage: FileImage(File(data.image))),
                            TextButton(
                                onPressed: () {
                                  log("${data}");
                                  value.passingController(data);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => Fillingtheform(
                                                isedit: true,
                                                id: data.id,
                                              )));
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(color: Color(0xff4F7B39)),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }));
  }
}
