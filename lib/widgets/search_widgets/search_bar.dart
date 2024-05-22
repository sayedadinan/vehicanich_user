import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/search_bloc/bloc/search_bloc.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Padding(
        padding: EdgeInsets.only(
            left: Mymediaquery().mediaquerywidth(0.04, context),
            right: Mymediaquery().mediaquerywidth(0.04, context)),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchValueAdded(value: value));
          },
          decoration: InputDecoration(
            hintText: 'search shops . . .',
            hintStyle: TextStyle(
              color: Myappallcolor().buttonforgroundcolor,
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                  color: Myappallcolor().buttonforgroundcolor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                  color: Myappallcolor().buttonforgroundcolor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                  color: Myappallcolor().buttonforgroundcolor, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
