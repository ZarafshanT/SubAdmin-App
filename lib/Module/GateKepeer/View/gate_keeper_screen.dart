import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/GateKepeer/Controller/gate_keeper_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/DetailShownDialogBox/Detail_shown_dialog_box.dart';
import '../../../Widgets/My Dialog Box/my_dialog_box.dart';
import '../../../Widgets/ResidentNGateKeeperViewCard/resident_n_gatekeeper_view_card.dart';

class GateKeeperScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GateKeeperController>(
      init: GateKeeperController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(homescreen, arguments: controller.user);

          return true;
        },
        child: Scaffold(
          body: Column(
            children: [
              MyBackButton(
                text: "Gatekeeper",
                onTap: () {
                  Get.offNamed(homescreen, arguments: controller.user);
                },
              ),
              FutureBuilder(
                  future: controller.viewGatekeepersApi(
                      controller.userdata.userid!,
                      controller.userdata.bearerToken!),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data != null && snapshot.data!.length != 0) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            insetAnimationCurve:
                                                Curves.bounceIn,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(350),
                                              child: Padding(
                                                padding: EdgeInsets.all(12),
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          snapshot.data![index]
                                                                  .firstName +
                                                              " " +
                                                              snapshot
                                                                  .data![index]
                                                                  .lastName,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color: HexColor(
                                                                '#4D4D4D'),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                ScreenUtil()
                                                                    .setSp(18),
                                                          ),
                                                        ),
                                                        10.ph,
                                                        Text(
                                                          snapshot.data![index]
                                                              .mobileno,
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
                                                    20.ph,
                                                    DetailShownDialogBox(
                                                      icon:
                                                          'assets/personsvg.svg',
                                                      heading: 'Name',
                                                      text: snapshot
                                                              .data![index]
                                                              .firstName +
                                                          " " +
                                                          snapshot.data![index]
                                                              .lastName,
                                                    ),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/contactsvg.svg',
                                                        heading: 'Mobile No',
                                                        text: snapshot
                                                            .data![index]
                                                            .mobileno
                                                            .toString()),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/addresssvg.svg',
                                                        heading: 'Address',
                                                        text: snapshot
                                                            .data![index]
                                                            .address),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/cnicsvg.svg',
                                                        heading: 'Gate No',
                                                        text: snapshot
                                                            .data![index]
                                                            .gateno),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/cnicsvg.svg',
                                                        heading: 'CNIC',
                                                        text: snapshot
                                                            .data![index].cnic)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });

                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return Dialog(
                                    //         shape: RoundedRectangleBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(20),
                                    //         ),
                                    //         elevation: 0,
                                    //         child: Container(
                                    //           width: 630,
                                    //           height: 630,
                                    //           decoration: BoxDecoration(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       40)),
                                    //           child: Stack(
                                    //             children: [
                                    //               Column(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   Padding(
                                    //                     padding:
                                    //                         const EdgeInsets
                                    //                                 .only(
                                    //                             top: 22,
                                    //                             left: 99),
                                    //                     child: Text(
                                    //                       snapshot.data![index]
                                    //                               .firstName +
                                    //                           " " +
                                    //                           snapshot
                                    //                               .data![index]
                                    //                               .lastName,
                                    //                       style: GoogleFonts
                                    //                           .montserrat(
                                    //                               color: HexColor(
                                    //                                   '#262626'),
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w700),
                                    //                     ),
                                    //                   ),
                                    //                   Padding(
                                    //                     padding:
                                    //                         const EdgeInsets
                                    //                                 .only(
                                    //                             top: 12,
                                    //                             left: 99),
                                    //                     child: Text(
                                    //                       snapshot.data![index]
                                    //                           .mobileno,
                                    //                       style: GoogleFonts
                                    //                           .montserrat(
                                    //                               color: HexColor(
                                    //                                   '#262626'),
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w300),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //               Column(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   Row(
                                    //                     children: [
                                    //                       Padding(
                                    //                         padding:
                                    //                             const EdgeInsets
                                    //                                     .fromLTRB(
                                    //                                 20,
                                    //                                 100,
                                    //                                 0,
                                    //                                 0),
                                    //                         child: SvgPicture
                                    //                             .asset(
                                    //                           'assets/addresssvg.svg',
                                    //                         ),
                                    //                       ),
                                    //                       Padding(
                                    //                         padding:
                                    //                             const EdgeInsets
                                    //                                     .fromLTRB(
                                    //                                 10,
                                    //                                 100,
                                    //                                 0,
                                    //                                 0),
                                    //                         child: Text(
                                    //                           "Address",
                                    //                           style: GoogleFonts.montserrat(
                                    //                               color: HexColor(
                                    //                                   '#4D4D4D'),
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .bold),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   Padding(
                                    //                     padding:
                                    //                         const EdgeInsets
                                    //                                 .fromLTRB(
                                    //                             50, 10, 0, 0),
                                    //                     child: Text(
                                    //                       snapshot.data![index]
                                    //                           .address,
                                    //                       style: GoogleFonts
                                    //                           .montserrat(
                                    //                               fontSize: 16,
                                    //                               color: HexColor(
                                    //                                   '#1A1A1A'),
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w400),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //               Column(
                                    //                 children: [
                                    //                   Row(
                                    //                     children: [
                                    //                       Column(
                                    //                         crossAxisAlignment:
                                    //                             CrossAxisAlignment
                                    //                                 .start,
                                    //                         children: [
                                    //                           Row(
                                    //                             children: [
                                    //                               Padding(
                                    //                                 padding:
                                    //                                     const EdgeInsets.fromLTRB(
                                    //                                         20,
                                    //                                         230,
                                    //                                         0,
                                    //                                         0),
                                    //                                 child: SvgPicture
                                    //                                     .asset(
                                    //                                   'assets/cnicsvg.svg',
                                    //                                 ),
                                    //                               ),
                                    //                               Padding(
                                    //                                 padding:
                                    //                                     const EdgeInsets.fromLTRB(
                                    //                                         5,
                                    //                                         230,
                                    //                                         0,
                                    //                                         0),
                                    //                                 child: Text(
                                    //                                   "Residental Type",
                                    //                                   style: GoogleFonts.montserrat(
                                    //                                       color: HexColor(
                                    //                                           '#4D4D4D'),
                                    //                                       fontWeight:
                                    //                                           FontWeight.bold),
                                    //                                 ),
                                    //                               ),
                                    //                             ],
                                    //                           ),
                                    //                           Padding(
                                    //                             padding:
                                    //                                 const EdgeInsets
                                    //                                         .fromLTRB(
                                    //                                     39,
                                    //                                     20,
                                    //                                     0,
                                    //                                     0),
                                    //                             child: Text(
                                    //                               snapshot
                                    //                                   .data![
                                    //                                       index]
                                    //                                   .gateno,
                                    //                               style: GoogleFonts.montserrat(
                                    //                                   fontSize:
                                    //                                       16,
                                    //                                   color: HexColor(
                                    //                                       '#1A1A1A'),
                                    //                                   fontWeight:
                                    //                                       FontWeight
                                    //                                           .w400),
                                    //                             ),
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                     ],
                                    //                   ),

                                    //                   //Mobile NO
                                    //                   Column(
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                     children: [
                                    //                       Row(
                                    //                         children: [
                                    //                           Padding(
                                    //                             padding:
                                    //                                 const EdgeInsets
                                    //                                         .fromLTRB(
                                    //                                     20,
                                    //                                     10,
                                    //                                     0,
                                    //                                     0),
                                    //                             child:
                                    //                                 SvgPicture
                                    //                                     .asset(
                                    //                               'assets/contactsvg.svg',
                                    //                             ),
                                    //                           ),
                                    //                           Padding(
                                    //                             padding:
                                    //                                 const EdgeInsets
                                    //                                         .fromLTRB(
                                    //                                     10,
                                    //                                     10,
                                    //                                     0,
                                    //                                     0),
                                    //                             child: Text(
                                    //                               "Mobile No",
                                    //                               style: GoogleFonts.montserrat(
                                    //                                   color: HexColor(
                                    //                                       '#4D4D4D'),
                                    //                                   fontWeight:
                                    //                                       FontWeight
                                    //                                           .bold),
                                    //                             ),
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                       Padding(
                                    //                         padding:
                                    //                             const EdgeInsets
                                    //                                     .fromLTRB(
                                    //                                 50,
                                    //                                 10,
                                    //                                 0,
                                    //                                 0),
                                    //                         child: Text(
                                    //                           snapshot
                                    //                               .data![index]
                                    //                               .mobileno,
                                    //                           style: GoogleFonts.montserrat(
                                    //                               fontSize: 16,
                                    //                               color: HexColor(
                                    //                                   '#1A1A1A'),
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w400),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),

                                    //                   //CNIC
                                    //                   Column(
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                     children: [
                                    //                       Row(
                                    //                         children: [
                                    //                           Padding(
                                    //                             padding:
                                    //                                 const EdgeInsets
                                    //                                         .fromLTRB(
                                    //                                     20,
                                    //                                     10,
                                    //                                     0,
                                    //                                     0),
                                    //                             child:
                                    //                                 SvgPicture
                                    //                                     .asset(
                                    //                               'assets/cnicsvg.svg',
                                    //                             ),
                                    //                           ),
                                    //                           Padding(
                                    //                             padding:
                                    //                                 const EdgeInsets
                                    //                                         .fromLTRB(
                                    //                                     10,
                                    //                                     10,
                                    //                                     0,
                                    //                                     0),
                                    //                             child: Text(
                                    //                               "Cnic",
                                    //                               style: GoogleFonts.montserrat(
                                    //                                   color: HexColor(
                                    //                                       '#4D4D4D'),
                                    //                                   fontWeight:
                                    //                                       FontWeight
                                    //                                           .bold),
                                    //                             ),
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                       Padding(
                                    //                         padding:
                                    //                             const EdgeInsets
                                    //                                     .fromLTRB(
                                    //                                 50,
                                    //                                 10,
                                    //                                 0,
                                    //                                 0),
                                    //                         child: Text(
                                    //                           snapshot
                                    //                               .data![index]
                                    //                               .cnic,
                                    //                           style: GoogleFonts.montserrat(
                                    //                               fontSize: 16,
                                    //                               color: HexColor(
                                    //                                   '#1A1A1A'),
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w400),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       );
                                    //     });
                                  },
                                  child: ResidentsNGateKeeperViewCard(
                                    image: Api.imageBaseUrl +
                                        snapshot.data![index].image.toString(),
                                    name: snapshot.data![index].firstName
                                            .toString() +
                                        " " +
                                        snapshot.data![index].lastName
                                            .toString(),
                                    mobileno: snapshot.data![index].mobileno
                                        .toString(),
                                    DeleteDialogPress: () {
                                      controller.deleteGateKeeperApi(
                                          snapshot.data![index].gatekeeperid,
                                          controller.userdata.bearerToken!);
                                    },
                                  ));
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        );
                      } else {
                        return Center(
                            child: Text('No GateKeepers',
                                style: GoogleFonts.ubuntu(
                                    color: HexColor('#404345'),
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.0015,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)));
                      }
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: primaryColor,
                      ));
                    }
                  }),
            ],
          ),
          floatingActionButton: IconButton(
              padding: EdgeInsets.only(top: 85.w),
              iconSize: 53.w,
              icon: SvgPicture.asset('assets/floatingbutton.svg'),
              onPressed: () {
                Get.offNamed(addgatekeeperscreen, arguments: controller.user);
              }),
        ),
      ),
    );
  }
}
