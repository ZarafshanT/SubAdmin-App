import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../Constants/constants.dart';
import '../My Dialog Box/my_dialog_box.dart';

class ResidentsNGateKeeperViewCard extends StatelessWidget {
  ResidentsNGateKeeperViewCard({
    required this.image,
    required this.name,
    required this.mobileno,
    this.DeleteDialogPress,
    this.updateOnPressed,
    this.showButton = true,
  });
  String? image;

  String? name;
  String? mobileno;
  bool showButton;

  void Function()? DeleteDialogPress;
  void Function()? updateOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
      width: 32.w,
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
      height: 88.h,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14.4.h, left: 4.w),
              child: Container(
                width: 90.4.w,
                height: 61.6.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.cover),
                ),
              ),
            ),
            10.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(16),
                      color: HexColor('#404345')),
                ),
                10.pw,
                Text(
                  mobileno!,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w200,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            if (showButton)
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 55.h),
                child: Row(
                  children: [
                    Container(
                      height: 22.h,
                      width: 22.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: primaryColor),
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/delete_noticboard_icon.svg",
                            width: MediaQuery.of(context).size.width),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  image: SvgPicture.asset(
                                      "assets/showdialog_delete_icon.svg",
                                      width: MediaQuery.of(context).size.width *
                                          0.06),
                                  negativeBtnPressed: () {
                                    Get.back();
                                  },
                                  title: "Are you sure !",
                                  content: "Do you want to delete this?",
                                  positiveBtnText: "Delete",
                                  negativeBtnText: "Cancel",
                                  positiveBtnPressed: DeleteDialogPress,
                                );
                              });
                        },
                      ),
                    ),
                    6.pw,
                    Container(
                      height: 22.h,
                      width: 22.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: primaryColor),
                      child: IconButton(
                        icon: SvgPicture.asset("assets/edit_icon.svg",
                            width: MediaQuery.of(context).size.width),
                        onPressed: updateOnPressed,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ]),
    );
  }
}
