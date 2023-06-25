import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Constants/constants.dart';

class MyText extends GetView {
  final String? name;
Color? color;

  MyText({required this.name,this.color});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(name!,
        style: GoogleFonts.ubuntu(
            fontStyle:
            FontStyle.normal,
            // color: secondaryColor,
            fontWeight:
            FontWeight.w400,
            fontSize: 14,
            color:color??Colors.black)),
    );
  }
}
