import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class RightChild extends StatelessWidget {
  const RightChild({
    super.key,
    required this.title,
    required this.message,
    this.disabled = true,
  });

  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
