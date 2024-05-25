import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/search_bloc/bloc/search_bloc.dart';
import 'package:vehicanich/screens/search_screen/search_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';

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
            suffixIcon: const Icon(Icons.search, color: Colors.white),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(37.0),
              borderSide: BorderSide(
                  color: Myappallcolor().buttonforgroundcolor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(38.0),
              borderSide: BorderSide(
                  color: Myappallcolor().buttonforgroundcolor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(38.0),
              borderSide: BorderSide(
                  color: Myappallcolor().buttonforgroundcolor, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchFieldForHome extends StatelessWidget {
  const CustomSearchFieldForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          FadeTransitionPageRoute(child: const SearchScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: Mymediaquery().mediaquerywidth(0.04, context),
            right: Mymediaquery().mediaquerywidth(0.04, context)),
        child: AbsorbPointer(
          child: TextField(
            readOnly: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'search shops . . .',
              hintStyle: TextStyle(
                color: Myappallcolor().buttonforgroundcolor,
              ),
              suffixIcon: Icon(Icons.search,
                  color: Myappallcolor().buttonforgroundcolor),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(37.0),
                borderSide: BorderSide(
                    color: Myappallcolor().buttonforgroundcolor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(38.0),
                borderSide: BorderSide(
                    color: Myappallcolor().buttonforgroundcolor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(38.0),
                borderSide: BorderSide(
                    color: Myappallcolor().buttonforgroundcolor, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
