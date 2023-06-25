import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

class DetailShownDialogBox extends StatelessWidget {
  final String? heading;
  final String? text;
  final String? icon;

  const DetailShownDialogBox(
      {required this.heading, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon!),
            10.pw,
            Text(
              heading!,
              style: GoogleFonts.ubuntu(
                color: HexColor('#4D4D4D'),
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ],
        ),
        10.ph,
        Wrap(
          children: [
            30.pw,
            Text(
              text!,
              style: GoogleFonts.ubuntu(
                  color: HexColor('#1A1A1A'),
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(16)),
            ),
          ],
        ),
        10.ph
      ],
    );
  }
}
