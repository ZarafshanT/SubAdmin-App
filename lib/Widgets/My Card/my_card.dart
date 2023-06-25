import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends GetView {
  EdgeInsetsGeometry padding;
  String? imgpath;
  String? text;
  void Function()? onTap;
  MyCard({this.onTap, this.text, required this.padding, this.imgpath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.16,
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  child: Image.asset(imgpath!),
                  width: MediaQuery.of(context).size.width * 0.150,
                  height: MediaQuery.of(context).size.height * 0.253,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.020,
                      vertical: MediaQuery.of(context).size.height * 0.020),
                  child: Text(
                    text!,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
