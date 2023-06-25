import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle txtStyle(
  double fontsize,
  Color color,
  FontWeight fw,
  FontStyle fontStyle,
) {
  return GoogleFonts.ubuntu(
    fontSize: ScreenUtil().setSp(fontsize),
    color: color,
    fontWeight: fw,
    fontStyle: fontStyle,
  );
}

TextStyle textStyle(
  double fontsize,
  Color color,
  FontWeight fw,
  FontStyle fontStyle,
) {
  return GoogleFonts.quicksand(
    fontSize: ScreenUtil().setSp(fontsize),
    color: color,
    fontWeight: fw,
    fontStyle: fontStyle,
  );
}

TextStyle btntextStyle(
  double fontsize,
  Color color,
  FontWeight fw,
  FontStyle fontStyle,
) {
  return GoogleFonts.poppins(
      fontSize: ScreenUtil().setSp(fontsize),
      color: color,
      fontWeight: fw,
      fontStyle: fontStyle);
}

// TextStyle montserratStyle(
//     double size, Color color, FontWeight fw, FontStyle fontStyle) {
//   return GoogleFonts.montserrat(
//       fontSize: size.sp, color: color, fontWeight: fw, fontStyle: fontStyle);
// }
