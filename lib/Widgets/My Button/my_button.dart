import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/ReusableTextWidget/custom_text.dart';
import '../../Constants/constants.dart';

class MyButton extends StatelessWidget {
  final OutlinedBorder? outlinedBorder;
  final double? height;
  final double? width;
  final double? elevation;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? border;
  final String name;
  final Color? color;
  final Color? textColor;
  final int? maxLines;
  final bool? loading;
  final TextStyle textStyle;
  final void Function()? onPressed;
  const MyButton(
      {super.key,
      this.outlinedBorder,
      this.elevation,
      this.fontWeight,
      this.letterSpacing,
      this.fontSize,
      this.textColor,
      this.height,
      this.width,
      this.border,
      required this.name,
      this.color,
      this.maxLines,
      this.onPressed,
      this.loading = false,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 180.26.w,
      height: height ?? 43.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation ?? 5,
            shape: outlinedBorder ??
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0.r)),
            backgroundColor: color ?? primaryColor),
        child: loading!
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : ReusableText(text: name, style: textStyle),
        onPressed: onPressed,
      ),
    );
  }
}
