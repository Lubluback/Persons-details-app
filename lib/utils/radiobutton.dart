// import 'package:flutter/material.dart';
// import 'package:persons_details_app/controller/getx_controller.dart';

// GetxControllers radioButtonController = GetxControllers();
// late final String text;
// Widget buildRadioButton(int value) {
//   return Row(
//     children: [
//       RadioListTile(
//         title: Text(text),
//         value: value,
//         groupValue: radioButtonController.selectedValue.value,
//         onChanged: (int? newValue) {
//           radioButtonController.setSelectedValue(newValue!);
//         },
//       ),
//       Text(''),
//     ],
//   );
// }

enum Occupation{
  houseWife,
  teacher,
  business,
  job,
  other,

}