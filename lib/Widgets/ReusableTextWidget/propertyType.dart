import 'package:flutter/material.dart';

class PropertyType extends StatelessWidget {
  final String text;
  const PropertyType({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text.rich(TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: Color(0xFF6A7380),
              fontSize: 14,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Color(0xFFFF6D17),
              fontSize: 14,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ))
    ]);
  }
}
