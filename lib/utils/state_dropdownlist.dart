// import 'package:country_state_city/country_state_city.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:persons_details_app/controller/getx_controller.dart';


// class CountryDropDownList extends StatelessWidget {
//   CountryDropDownList({super.key});
//   // final OccupationController occucontroller = OccupationController();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<GetxControllers>(builder: (controller) {
//       return FormField<String>(
//         builder: (FormFieldState<String> state) {
//           return InputDecorator(
//             decoration: InputDecoration(
//                 //labelStyle: textStyle,
//                 errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
//                 hintText: 'Please select expense',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10))),
//             // isEmpty: _currentSelectedValue == '',
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<Country>(
//                 value: controller.countryChange,
//                 isDense: true,
//                 onChanged: (Country? newValue) {
//                   print(newValue!.isoCode);
//                   controller.setCountryValue(newValue);
//                   // setState(() {
//                   //   _currentSelectedValue = newValue;
//                   //   state.didChange(newValue);
//                   // });
//                 },
//                 items: controller.contries.map((Country value) {
//                   return DropdownMenuItem<Country>(
//                     value: value,
//                     child: Text(value.name),
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       );
//     });
//   }
// }
