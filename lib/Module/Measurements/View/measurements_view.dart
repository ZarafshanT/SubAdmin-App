import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Measurements/Controller/measurement_view_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/ReusableTextWidget/custom_text.dart';
import 'package:societyadminapp/Widgets/ReusableTextWidget/textstyle.dart';

import '../../../Constants/constants.dart';

class MeasurementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeasurementViewController>(
        init: MeasurementViewController(),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                floatingActionButton: IconButton(
                    padding: EdgeInsets.only(top: 85),
                    iconSize: MediaQuery.of(context).size.height * 0.065,
                    icon: SvgPicture.asset('assets/floatingbutton.svg'),
                    onPressed: () {
                      Get.offNamed(addmeasurements, arguments: controller.user);
                    }),
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Measurement View',
                      onTap: () {
                        Get.offNamed(homescreen, arguments: controller.user);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: Column(
                        children: [
                          32.ph,
                          Container(
                            width: 329.w,
                            decoration: ShapeDecoration(
                                color: Color(0x28FFA115),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w, color: Color(0xFFFFA115)),
                                  borderRadius: BorderRadius.circular(8.r),
                                )),
                            child: TabBar(
                              unselectedLabelColor: Color(0xFF5A5A5A),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Colors.white,
                              indicator: ShapeDecoration(
                                color: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              indicatorColor: primaryColor,
                              tabs: [
                                Tab(
                                    child: Text(
                                  'Houses',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                )),
                                Tab(
                                  child: Text(
                                    'Apartments',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    37.ph,
                    Expanded(
                      child: TabBarView(
                        children: [
                          FutureBuilder(
                              future: controller.housesApartmentsModelApi(
                                  subadminid: controller.user.userid!,
                                  token: controller.user.bearerToken!,
                                  type: 'house'),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 23.w,
                                            right: 23.w,
                                            bottom: 15.h),
                                        child: Expanded(
                                          child: Container(
                                            width: 329.w,
                                            height: 260.h,
                                            padding: EdgeInsets.only(
                                                left: 20.w,
                                                top: 20.h,
                                                bottom: 20.h),
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFF3F4F5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ReusableText(
                                                    text: 'House details',
                                                    style: textStyle(
                                                        16,
                                                        Color(0xFF0D0B0C),
                                                        FontWeight.w700,
                                                        FontStyle.normal)),
                                                16.ph,
                                                Container(
                                                    width: 208.w,
                                                    height: 175.h,
                                                    child: Stack(children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: ReusableText(
                                                            text: 'Unit Type',
                                                            style: textStyle(
                                                                14,
                                                                Color(
                                                                    0xFF6A7380),
                                                                FontWeight.w500,
                                                                FontStyle
                                                                    .normal)),
                                                      ),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 0,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .unit
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 34.h,
                                                          child: ReusableText(
                                                              text:
                                                                  'Sevice Charges',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 34.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .charges
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 68.h,
                                                          child: ReusableText(
                                                              text: 'Tax',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 68.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .tax
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 102.h,
                                                          child: ReusableText(
                                                              text:
                                                                  'App Charges',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 102.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .appcharges
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 136.h,
                                                          child: ReusableText(
                                                              text: 'Area',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                        left: 133.w,
                                                        top: 136.h,
                                                        child: ReusableText(
                                                            text: snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .area
                                                                    .toString() +
                                                                ' ' +
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .unit
                                                                    .toString(),
                                                            style: textStyle(
                                                                14,
                                                                Color(
                                                                    0xFF0D0B0C),
                                                                FontWeight.w600,
                                                                FontStyle
                                                                    .normal)),
                                                      ),
                                                    ])),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  );
                                }
                              }),
                          FutureBuilder(
                              future: controller.housesApartmentsModelApi(
                                  subadminid: controller.user.userid!,
                                  token: controller.user.bearerToken!,
                                  type: 'apartment'),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 23.w,
                                            right: 23.w,
                                            bottom: 15.h),
                                        child: Expanded(
                                          child: Container(
                                            width: 329.w,
                                            height: 260.h,
                                            padding: EdgeInsets.only(
                                                left: 20.w, top: 20.h),
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFF3F4F5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ReusableText(
                                                    text: 'Apartments details',
                                                    style: textStyle(
                                                        16,
                                                        Color(0xFF0D0B0C),
                                                        FontWeight.w700,
                                                        FontStyle.normal)),
                                                16.ph,
                                                Container(
                                                  width: 208.w,
                                                  height: 175.h,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: ReusableText(
                                                            text: 'Unit Type',
                                                            style: textStyle(
                                                                14,
                                                                Color(
                                                                    0xFF6A7380),
                                                                FontWeight.w500,
                                                                FontStyle
                                                                    .normal)),
                                                      ),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 0,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .unit,
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                        left: 0,
                                                        top: 34.h,
                                                        child: ReusableText(
                                                            text:
                                                                'Sevice Charges',
                                                            style: textStyle(
                                                                14,
                                                                Color(
                                                                    0xFF6A7380),
                                                                FontWeight.w500,
                                                                FontStyle
                                                                    .normal)),
                                                      ),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 34.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .charges
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 68.h,
                                                          child: ReusableText(
                                                              text: 'Tax',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 68.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .tax
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 102.h,
                                                          child: ReusableText(
                                                              text:
                                                                  'App Charges',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 102.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .appcharges
                                                                  .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 0,
                                                          top: 136.h,
                                                          child: ReusableText(
                                                              text: 'Area',
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF6A7380),
                                                                  FontWeight
                                                                      .w500,
                                                                  FontStyle
                                                                      .normal))),
                                                      Positioned(
                                                          left: 133.w,
                                                          top: 136.h,
                                                          child: ReusableText(
                                                              text: snapshot
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .area
                                                                      .toString() +
                                                                  snapshot
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .unit
                                                                      .toString(),
                                                              style: textStyle(
                                                                  14,
                                                                  Color(
                                                                      0xFF0D0B0C),
                                                                  FontWeight
                                                                      .w600,
                                                                  FontStyle
                                                                      .normal))),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
