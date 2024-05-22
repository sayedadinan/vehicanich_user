// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
// // Ensure to import your connectivity service

// class ConnectivityWidget extends StatelessWidget {
//   final Widget child;

//   const ConnectivityWidget({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ConnectivityResult>(
//       stream: ConnectivityService().connectivityStream,
//       builder: (context, snapshot) {
//         if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
//           return child;
//         } else {
//           return _buildNoConnectionWidget();
//         }
//       },
//     );
//   }

//   Widget _buildNoConnectionWidget() {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//                 'assets/no_internet.png'), // Ensure you have an image at this path
//             SizedBox(height: 20),
//             Text(
//               'No Internet Connection',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
