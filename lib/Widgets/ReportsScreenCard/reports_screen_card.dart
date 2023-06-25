import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../My Button/my_button.dart';
import '../ReusableTextWidget/textstyle.dart';

class ReportsScreenCard extends StatelessWidget {
  ReportsScreenCard(
      {this.img,
      this.heading,
      this.heading1,
      this.heading2,
      this.onPressed,
      this.showImg = true,
      this.showIcon = true,
      this.buttonName,
      this.color});

  String? img;
  bool showImg;
  bool showIcon;

  String? heading;
  String? heading1;
  String? heading2;
  void Function()? onPressed;
  String? buttonName;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h),
      child: Container(
        width: 327.w,
        height: 92.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: Color.fromRGBO(187, 187, 187, 0.3),
            width: 0.3.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(50, 50, 71, 0.08),

              blurRadius: 32,
              offset: Offset(0, 24), // changes position of shadow
            ),
          ],
          color: HexColor('#FFFFFF'),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: (showIcon) ? 19.w : 12.w, top: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showImg && img != null)
                Container(
                    width: 70.4.w,
                    height: 64.h,
                    child: Image.network(
                      img!,
                      fit: BoxFit.fill,
                    )),
              14.6.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading!,
                    maxLines: 1,
                    style: GoogleFonts.ubuntu(
                        color: HexColor('#404345'),
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.0015,
                        fontSize: 16.font,
                        fontWeight: FontWeight.w500),
                  ),
                  6.ph,
                  Text(
                    heading1!,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.ubuntu(
                        color: HexColor('#AAAAAA'),
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.0015,
                        fontSize: 12.font,
                        fontWeight: FontWeight.w400),
                  ),
                  3.ph,
                  if (showIcon) 9.86.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showIcon) ...[
                        Icon(
                          Icons.calendar_month,
                          color: HexColor('#FF9900'),
                          size: 16.72.w,
                        ),
                        11.32.pw,
                      ],
                      Text(
                        heading2!,
                        style: GoogleFonts.ubuntu(
                            color: HexColor('#AAAAAA'),
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.0015,
                            fontSize: 12.font,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 40.h, left: (showIcon) ? 120.w : 52.w),
                child: MyButton(
                  name: buttonName!,
                  color: color,
                  fontSize: 8.font,
                  height: 21.h,
                  width: 70.w,
                  fontWeight: FontWeight.w400,
                  outlinedBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0.r)),
                  letterSpacing: 0.05,
                  onPressed: onPressed,
                  textStyle: btntextStyle(
                      20, Colors.white, FontWeight.w500, FontStyle.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
