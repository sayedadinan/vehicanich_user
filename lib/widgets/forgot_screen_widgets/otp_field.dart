// import 'package:flutter/material.dart';
// import 'package:vehicanich/utils/app_colors.dart';
// import 'package:vehicanich/utils/mediaquery.dart';

// class OTPTextField extends StatelessWidget {
//   final int length;
//   final ValueChanged<String>? onChanged;

//   const OTPTextField({
//     Key? key,
//     required this.length,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<FocusNode> focusNodes = List.generate(length, (index) => FocusNode());
//     List<TextEditingController> controllers =
//         List.generate(length, (index) => TextEditingController());

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(
//         length,
//         (index) => SizedBox(
//           width: Mymediaquery().mediaquerywidth(0.08, context),
//           height: Mymediaquery().mediaqueryheight(0.08, context),
//           child: TextField(
//             controller: controllers[index],
//             focusNode: focusNodes[index],
//             style: TextStyle(color: Myappallcolor().textcolor),
//             keyboardType: TextInputType.number,
//             textAlign: TextAlign.center,
//             maxLength: 1,
//             onChanged: (value) {
//               if (value.isNotEmpty && index < length - 1) {
//                 focusNodes[index].unfocus();
//                 FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//               } else if (value.isEmpty && index > 0) {
//                 focusNodes[index].unfocus();
//                 FocusScope.of(context).requestFocus(focusNodes[index - 1]);
//               }
//               if (onChanged != null) {
//                 String otp = '';
//                 for (var controller in controllers) {
//                   otp += controller.text;
//                 }
//                 onChanged(otp);
//               }
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Myappallcolor().textcolor,
//               counter: Offstage(),
//               border: OutlineInputBorder(),
//               enabledBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(width: 1, color: Myappallcolor().textcolor),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1, color: Myappallcolor().buttonforgroundcolor),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
