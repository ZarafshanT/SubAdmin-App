import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/constants.dart';
import '../My Button/my_button.dart';
import '../ReusableTextWidget/textstyle.dart';

class CustomDialog extends StatelessWidget {
  final String? title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback? positiveBtnPressed;
  final GestureTapCallback? negativeBtnPressed;
  final Widget? image;

  CustomDialog({
    this.image,
    this.title,
    this.content,
    this.positiveBtnText,
    this.negativeBtnText,
    this.positiveBtnPressed,
    this.negativeBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 2,
          // Bottom rectangular box
          margin:
              EdgeInsets.only(top: 24), // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.only(
              top: 60, left: 20, right: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: GoogleFonts.montserrat(
                    color: primaryColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                content!,
                style: GoogleFonts.montserrat(
                    color: HexColor('#4D4D4D'), fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 100,
                children: <Widget>[
                  MyButton(
                    outlinedBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width * 0.23,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: MediaQuery.of(context).size.height * 0.03,
                    name: positiveBtnText!,
                    color: HexColor('#DC3545'),
                    elevation: 0,
                    onPressed: positiveBtnPressed,
                    textStyle: btntextStyle(
                        20, Colors.white, FontWeight.w500, FontStyle.normal),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  MyButton(
                    outlinedBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width * 0.23,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: MediaQuery.of(context).size.height * 0.03,
                    name: negativeBtnText!,
                    color: HexColor('#E8E8E8'),
                    elevation: 0,
                    onPressed: negativeBtnPressed,
                    textStyle: btntextStyle(
                        20, Colors.white, FontWeight.w500, FontStyle.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: primaryColor,
          // Top Circle with icon
          maxRadius: 30.0,
          child: image,
        ),
      ],
    );
  }
}
