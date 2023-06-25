import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/constants.dart';

// ignore: must_be_immutable
class AdminScreenContainer extends StatelessWidget {
  AdminScreenContainer(
      {required this.onTap, required this.icon, required this.text});
  void Function()? onTap;
  String? icon;
  String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setHeight(72),
        width: ScreenUtil().setWidth(148),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).w,
          color: primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(4),
                top: ScreenUtil().setHeight(16),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(11),
                  bottom: ScreenUtil().setHeight(10),
                ),
                child: SvgPicture.asset(
                  icon!,
                  fit: BoxFit.scaleDown,
                ),
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setHeight(40),
                decoration: BoxDecoration(
                  color: HexColor('#FFDDA9'),
                  borderRadius: BorderRadius.circular(16).w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(8),
                top: ScreenUtil().setHeight(26),
              ),
              child: Text(
                text!,
                style: GoogleFonts.ubuntu(
                    fontSize: ScreenUtil().setSp(12),
                    fontStyle: FontStyle.normal,
                    color: HexColor('#FFFFFF'),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
