import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: const Column(
        children: [Text('helo search here')],
      ),
    );
  }
}
