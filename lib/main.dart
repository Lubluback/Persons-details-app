import 'package:flutter/material.dart';
import 'package:persons_details_app/provider/provider.dart';
import 'package:persons_details_app/view/listofpersons_details.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PersonDetailsFillingPrivider>(
        create: (context) => PersonDetailsFillingPrivider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ListofpersonsDetails(),
        ));
  }
}
