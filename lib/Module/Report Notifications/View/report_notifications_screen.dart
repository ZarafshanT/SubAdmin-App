import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/Report%20Notifications/Controller/notifications_controller.dart';
import 'package:societyadminapp/Module/Report%20Notifications/Model/Notification.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/DetailShownDialogBox/Detail_shown_dialog_box.dart';
import '../../../Widgets/Loader/loader.dart';

class ReportNotificationsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: ((controller) => SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                Get.offNamed(homescreen, arguments: controller.user);

                return true;
              },
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Notifications',
                      onTap: () {
                        Get.offNamed(homescreen, arguments: controller.user);
                      },
                    ),
                    Expanded(
                      child: FutureBuilder<List<ReportNotification>>(
                          future: controller.viewNotificationsApi(
                              controller.userData.userid!,
                              controller.userData.bearerToken!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null &&
                                  snapshot.data!.length != 0) {
                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  elevation: 0,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.600,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.600,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    40.r)),
                                                    child: Column(children: [
                                                      //Name And Number
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 23.h,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                      .data![
                                                                          index]
                                                                      .firstname! +
                                                                  " " +
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .lastname!,
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            18),
                                                              ),
                                                            ),
                                                            10.ph,
                                                            Text(
                                                              snapshot
                                                                  .data![index]
                                                                  .mobileno!,
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#1A1A1A'),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              16)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      20.ph,
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 14.99.w),
                                                        child: Column(
                                                          children: [
                                                            DetailShownDialogBox(
                                                                icon:
                                                                    'assets/contactsvg.svg',
                                                                heading:
                                                                    'Description',
                                                                text: snapshot
                                                                    .data![
                                                                        index]
                                                                    .description
                                                                    .toString()),
                                                            DetailShownDialogBox(
                                                                icon:
                                                                    'assets/contactsvg.svg',
                                                                heading:
                                                                    'Address',
                                                                text: snapshot
                                                                    .data![
                                                                        index]
                                                                    .address
                                                                    .toString()),
                                                            DetailShownDialogBox(
                                                                icon:
                                                                    'assets/contactsvg.svg',
                                                                heading:
                                                                    'Status',
                                                                text: snapshot
                                                                    .data![
                                                                        index]
                                                                    .statusdescription
                                                                    .toString()),
                                                          ],
                                                        ),
                                                      ),

                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets
                                                      //               .only(
                                                      //           top: 22,
                                                      //           left: 99),
                                                      //   child: Text(
                                                      //     overflow:
                                                      //         TextOverflow
                                                      //             .ellipsis,
                                                      //     snapshot
                                                      //         .data![index]
                                                      //         .title!
                                                      //         .toString(),
                                                      //     style: GoogleFonts.montserrat(
                                                      //         color: HexColor(
                                                      //             '#262626'),
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .w700),
                                                      //   ),
                                                      // ),

                                                      //       Padding(
                                                      //         padding:
                                                      //             const EdgeInsets
                                                      //                     .only(
                                                      //                 top: 12,
                                                      //                 left: 99),
                                                      //         child: Text(
                                                      //           snapshot
                                                      //               .data![index]
                                                      //               .mobileno!
                                                      //               .toString(),
                                                      //           style: GoogleFonts.montserrat(
                                                      //               color: HexColor(
                                                      //                   '#262626'),
                                                      //               fontWeight:
                                                      //                   FontWeight
                                                      //                       .w300),
                                                      //         ),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      //   //Address
                                                      //   Column(
                                                      //     crossAxisAlignment:
                                                      //         CrossAxisAlignment
                                                      //             .start,
                                                      //     children: [
                                                      //       Row(
                                                      //         children: [
                                                      //           Padding(
                                                      //             padding:
                                                      //                 const EdgeInsets
                                                      //                         .fromLTRB(
                                                      //                     20,
                                                      //                     100,
                                                      //                     0,
                                                      //                     0),
                                                      //             child:
                                                      //                 SvgPicture
                                                      //                     .asset(
                                                      //               'assets/address_icon.svg',
                                                      //             ),
                                                      //           ),
                                                      //           Padding(
                                                      //             padding:
                                                      //                 const EdgeInsets
                                                      //                         .fromLTRB(
                                                      //                     10,
                                                      //                     100,
                                                      //                     0,
                                                      //                     0),
                                                      //             child: Text(
                                                      //               "Description",
                                                      //               style: GoogleFonts.montserrat(
                                                      //                   color: HexColor(
                                                      //                       '#4D4D4D'),
                                                      //                   fontWeight:
                                                      //                       FontWeight
                                                      //                           .bold),
                                                      //             ),
                                                      //           ),
                                                      //         ],
                                                      //       ),
                                                      //       Padding(
                                                      //         padding:
                                                      //             const EdgeInsets
                                                      //                     .fromLTRB(
                                                      //                 50,
                                                      //                 10,
                                                      //                 0,
                                                      //                 0),
                                                      //         child: Text(
                                                      //           snapshot
                                                      //               .data![index]
                                                      //               .description!
                                                      //               .toString(),
                                                      //           style: GoogleFonts.montserrat(
                                                      //               fontSize: 16,
                                                      //               color: HexColor(
                                                      //                   '#1A1A1A'),
                                                      //               fontWeight:
                                                      //                   FontWeight
                                                      //                       .w400),
                                                      //         ),
                                                      //       ),
                                                      //     ],
                                                      //   ),

                                                      //   Column(
                                                      //     children: [
                                                      //       Row(
                                                      //         children: [
                                                      //           Column(
                                                      //             crossAxisAlignment:
                                                      //                 CrossAxisAlignment
                                                      //                     .start,
                                                      //             children: [
                                                      //               Row(
                                                      //                 children: [
                                                      //                   Padding(
                                                      //                     padding: const EdgeInsets.fromLTRB(
                                                      //                         20,
                                                      //                         230,
                                                      //                         0,
                                                      //                         0),
                                                      //                     child: SvgPicture
                                                      //                         .asset(
                                                      //                       'assets/address_icon.svg',
                                                      //                     ),
                                                      //                   ),
                                                      //                   Padding(
                                                      //                     padding: const EdgeInsets.fromLTRB(
                                                      //                         5,
                                                      //                         230,
                                                      //                         0,
                                                      //                         0),
                                                      //                     child:
                                                      //                         Text(
                                                      //                       "Residental Name",
                                                      //                       style: GoogleFonts.montserrat(
                                                      //                           color: HexColor('#4D4D4D'),
                                                      //                           fontWeight: FontWeight.bold),
                                                      //                     ),
                                                      //                   ),
                                                      //                 ],
                                                      //               ),
                                                      //               Padding(
                                                      //                 padding:
                                                      //                     const EdgeInsets.fromLTRB(
                                                      //                         39,
                                                      //                         20,
                                                      //                         0,
                                                      //                         0),
                                                      //                 child: Text(
                                                      //                   snapshot.data![index].firstname!
                                                      //                           .toString() +
                                                      //                       " " +
                                                      //                       snapshot
                                                      //                           .data![index]
                                                      //                           .lastname!
                                                      //                           .toString(),
                                                      //                   style: GoogleFonts.montserrat(
                                                      //                       fontSize:
                                                      //                           16,
                                                      //                       color: HexColor(
                                                      //                           '#1A1A1A'),
                                                      //                       fontWeight:
                                                      //                           FontWeight.w400),
                                                      //                 ),
                                                      //               ),
                                                      //             ],
                                                      //           ),
                                                      //         ],
                                                      //       ),

                                                      //       //VEHICLE NO
                                                      //       Column(
                                                      //         crossAxisAlignment:
                                                      //             CrossAxisAlignment
                                                      //                 .start,
                                                      //         children: [
                                                      //           Row(
                                                      //             children: [
                                                      //               Padding(
                                                      //                 padding:
                                                      //                     const EdgeInsets.fromLTRB(
                                                      //                         20,
                                                      //                         10,
                                                      //                         0,
                                                      //                         0),
                                                      //                 child: SvgPicture
                                                      //                     .asset(
                                                      //                   'assets/address_icon.svg',
                                                      //                 ),
                                                      //               ),
                                                      //               Padding(
                                                      //                 padding:
                                                      //                     const EdgeInsets.fromLTRB(
                                                      //                         10,
                                                      //                         10,
                                                      //                         0,
                                                      //                         0),
                                                      //                 child: Text(
                                                      //                   "Mobile No",
                                                      //                   style: GoogleFonts.montserrat(
                                                      //                       color: HexColor(
                                                      //                           '#4D4D4D'),
                                                      //                       fontWeight:
                                                      //                           FontWeight.bold),
                                                      //                 ),
                                                      //               ),
                                                      //             ],
                                                      //           ),
                                                      //           Padding(
                                                      //             padding:
                                                      //                 const EdgeInsets
                                                      //                         .fromLTRB(
                                                      //                     50,
                                                      //                     10,
                                                      //                     0,
                                                      //                     0),
                                                      //             child: Text(
                                                      //               snapshot
                                                      //                   .data![
                                                      //                       index]
                                                      //                   .mobileno!
                                                      //                   .toString(),
                                                      //               style: GoogleFonts.montserrat(
                                                      //                   fontSize:
                                                      //                       16,
                                                      //                   color: HexColor(
                                                      //                       '#1A1A1A'),
                                                      //                   fontWeight:
                                                      //                       FontWeight
                                                      //                           .w400),
                                                      //             ),
                                                      //           ),
                                                      //         ],
                                                      //       ),
                                                      //       //
                                                      //       //     //CNIC
                                                      //       //     Column(
                                                      //       //       crossAxisAlignment:
                                                      //       //       CrossAxisAlignment
                                                      //       //           .start,
                                                      //       //       children: [
                                                      //       //         Row(
                                                      //       //           children: [
                                                      //       //             Padding(
                                                      //       //               padding: const EdgeInsets.fromLTRB(
                                                      //       //                   20,
                                                      //       //                   10,
                                                      //       //                   0,
                                                      //       //                   0),
                                                      //       //               child: SvgPicture
                                                      //       //                   .asset(
                                                      //       //                 'assets/address_icon.svg',
                                                      //       //               ),
                                                      //       //             ),
                                                      //       //             Padding(
                                                      //       //               padding: const EdgeInsets.fromLTRB(
                                                      //       //                   10,
                                                      //       //                   10,
                                                      //       //                   0,
                                                      //       //                   0),
                                                      //       //               child:
                                                      //       //               Text(
                                                      //       //                 "Cnic",
                                                      //       //                 style: GoogleFonts.montserrat(
                                                      //       //                     color: HexColor('#4D4D4D'),
                                                      //       //                     fontWeight: FontWeight.bold),
                                                      //       //               ),
                                                      //       //             ),
                                                      //       //           ],
                                                      //       //         ),
                                                      //       //         Padding(
                                                      //       //           padding:
                                                      //       //           const EdgeInsets.fromLTRB(
                                                      //       //               50,
                                                      //       //               10,
                                                      //       //               0,
                                                      //       //               0),
                                                      //       //           child: Text(
                                                      //       //             snapshot
                                                      //       //                 .data![
                                                      //       //             index]
                                                      //       //                 .cnic!.toString(),
                                                      //       //             style: GoogleFonts.montserrat(
                                                      //       //                 fontSize:
                                                      //       //                 16,
                                                      //       //                 color: HexColor(
                                                      //       //                     '#1A1A1A'),
                                                      //       //                 fontWeight:
                                                      //       //                 FontWeight.w400),
                                                      //       //           ),
                                                      //       //         ),
                                                      //       //       ],
                                                      //       //     ),
                                                      //       //   ],
                                                      //       // ),
                                                      //     ],
                                                      //   ),

                                                      // ])
                                                    ]),
                                                  ));
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 24.w, right: 24.w, top: 32.h),
                                        child: Container(
                                          width: 327.w,
                                          height: 80.97.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/cardbackground.jpeg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    189, 224, 224, 223),
                                                spreadRadius: 5,
                                                blurRadius: 9,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: HexColor('#FFFFFF'),
                                          ),
                                          child: Stack(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 21.w, top: 9.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    snapshot.data![index].title!
                                                        .toString(),
                                                    style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: ScreenUtil()
                                                            .setSp(14),
                                                        color: HexColor(
                                                            '#404345')),
                                                  ),
                                                  8.ph,
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_month_outlined,
                                                        color:
                                                            HexColor('#7A7585'),
                                                        size: 16.w,
                                                      ),
                                                      5.pw,
                                                      Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        snapshot.data![index]
                                                            .created_at
                                                            .toString()
                                                            .toString()
                                                            .split('T')[0]
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            14),
                                                                color: HexColor(
                                                                    '#404345')),
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 36.h,
                                                left: 171.w,
                                              ),
                                              child: Row(children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary:
                                                          HexColor('#4EC018'),
                                                      fixedSize: Size(55, 22),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r))),
                                                  onPressed: () {
                                                    controller.AcceptButtonApi(
                                                        snapshot
                                                            .data![index].id!,
                                                        snapshot.data![index]
                                                            .userid!,
                                                        controller.userData
                                                            .bearerToken!);
                                                  },
                                                  child: Text(
                                                    'Accept',
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#FFFFFF'),
                                                        fontSize: ScreenUtil()
                                                            .setSp(9),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                9.pw,
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary:
                                                          HexColor('#ED0909'),
                                                      fixedSize: Size(55, 22),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r))),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content: Container(
                                                                height: 313.h,
                                                                width: 346.73.w,
                                                                child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          2,
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                              top: 30),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.r),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: <Widget>[
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 37.w, top: 55.29.h),
                                                                            child:
                                                                                Text(
                                                                              'Reason',
                                                                              style: GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontStyle: FontStyle.normal, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                          Form(
                                                                            key:
                                                                                controller.formKey,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(top: 9.75.h, left: 37.w, right: 37),
                                                                              child: SizedBox(
                                                                                height: 97.h,
                                                                                width: 273.w,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    // color: HexColor('#F9F9FA'),
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        color: HexColor('#F9F9FA'),
                                                                                        //blurRadius: 30.0, // soften the shadow

                                                                                        spreadRadius: 20,
                                                                                        offset: Offset(
                                                                                          5.0, // Move to right 5  horizontally
                                                                                          5.0, // Move to bottom 5 Vertically
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  child: TextFormField(
                                                                                    validator: (val) {
                                                                                      if (val!.isEmpty) {
                                                                                        return 'ENTER REASON';
                                                                                      }
                                                                                      return null;
                                                                                    },
                                                                                    decoration: InputDecoration(
                                                                                      hintText: 'Reason',
                                                                                      contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                                                                      fillColor: HexColor('#F9F9FA'),
                                                                                      filled: true,
                                                                                      enabledBorder: InputBorder.none,
                                                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                                                                                    ),
                                                                                    controller: controller.rejectcontroller,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          48.ph,
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              if (controller.formKey.currentState!.validate()) {
                                                                                controller.RejectButtonApi(snapshot.data![index].id!, snapshot.data![index].userid!, controller.rejectcontroller.text, controller.userData.bearerToken!);
                                                                                Get.back();
                                                                              } else {
                                                                                return null;
                                                                              }
                                                                            },
                                                                            child:
                                                                                Center(
                                                                              child: Container(
                                                                                height: 43.0.h,
                                                                                width: 180.0.w,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(10.r),
                                                                                  color: primaryColor,
                                                                                  boxShadow: [
                                                                                    BoxShadow(spreadRadius: 2, blurRadius: 12, color: Color.fromARGB(255, 128, 126, 126))
                                                                                  ],
                                                                                ),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Save',
                                                                                  style: GoogleFonts.ubuntu(color: HexColor('#FFFFFF')),
                                                                                )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    CircleAvatar(
                                                                        backgroundColor:
                                                                            primaryColor,
                                                                        maxRadius:
                                                                            30.0,
                                                                        child: SvgPicture.asset(
                                                                            'assets/reason_vector.svg')),
                                                                  ],
                                                                )),
                                                          );
                                                        });
                                                  },
                                                  child: Text(
                                                    'Reject',
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#FFFFFF'),
                                                        fontSize: ScreenUtil()
                                                            .setSp(9),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data!.length,
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    'No Notifications',
                                    style: GoogleFonts.ubuntu(
                                        color: HexColor('#404345'),
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.0015,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                                ;
                              }
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return Loader();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
