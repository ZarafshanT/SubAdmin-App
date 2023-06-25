import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/DetailShownDialogBox/Detail_shown_dialog_box.dart';
import '../../../Widgets/ResidentNGateKeeperViewCard/resident_n_gatekeeper_view_card.dart';
import '../Controller/view_residents_controller.dart';

class ViewResidents extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewResidentController>(
      init: ViewResidentController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(homescreen, arguments: controller.user);

          return true;
        },
        child: Scaffold(
          backgroundColor: HexColor('#F5F5F5'),
          body: Column(
            children: [
              MyBackButton(
                text: 'Residents',
                onTap: () {
                  Get.offNamed(homescreen, arguments: controller.user);
                },
              ),
              Expanded(
                child: FutureBuilder(
                    future: controller.viewResidentsApi(
                        controller.userdata.userid!,
                        controller.userdata.bearerToken!),
                    builder: (context, AsyncSnapshot snapshot) {
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
                                            insetAnimationCurve: Curves
                                                .easeInOutCubicEmphasized,
                                            insetAnimationDuration:
                                                Duration(seconds: 3),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(400),
                                              child: Padding(
                                                padding: EdgeInsets.all(12),
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          snapshot
                                                                  .data![
                                                                      index]
                                                                  .firstname +
                                                              " " +
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .lastname,
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
                                                        heading:
                                                            'Residental Type',
                                                        text: snapshot
                                                            .data![index]
                                                            .residenttype),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/cnicsvg.svg',
                                                        heading:
                                                            'Property Type',
                                                        text: snapshot
                                                            .data![index]
                                                            .propertytype),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/carsvg.svg',
                                                        heading: 'Vehicle No',
                                                        text: snapshot
                                                            .data![index]
                                                            .vechileno),
                                                    DetailShownDialogBox(
                                                        icon:
                                                            'assets/cnicsvg.svg',
                                                        heading: 'CNIC',
                                                        text: snapshot
                                                            .data![index]
                                                            .cnic),
                                                    // if (snapshot.data![index]
                                                    //         .residenttype ==
                                                    //     'Rental') ...[
                                                    //   ListView.builder(
                                                    //     shrinkWrap: true,
                                                    //     physics:
                                                    //         NeverScrollableScrollPhysics(),
                                                    //     itemCount: snapshot
                                                    //         .data.owner.length,
                                                    //     itemBuilder:
                                                    //         (context, resIndex) {
                                                    //       return Row(
                                                    //         children: [
                                                    //           Expanded(
                                                    //             child: ListView
                                                    //                 .builder(
                                                    //               shrinkWrap:
                                                    //                   true,
                                                    //               physics:
                                                    //                   NeverScrollableScrollPhysics(),
                                                    //               itemCount:
                                                    //                   snapshot
                                                    //                       .data[
                                                    //                           index]
                                                    //                       .owner
                                                    //                       .length,
                                                    //               itemBuilder:
                                                    //                   (context,
                                                    //                       resTableIndex) {
                                                    //                 return Column(
                                                    //                   children: [
                                                    //                     Text(
                                                    //                       'Owner Detail',
                                                    //                       style: GoogleFonts
                                                    //                           .montserrat(
                                                    //                         color:
                                                    //                             HexColor('#4D4D4D'),
                                                    //                         fontWeight:
                                                    //                             FontWeight.w700,
                                                    //                         fontSize:
                                                    //                             ScreenUtil().setSp(18),
                                                    //                       ),
                                                    //                     ),
                                                    //                     10.ph,
                                                    //                     DetailShownDialogBox(
                                                    //                         icon:
                                                    //                             'assets/contactsvg.svg',
                                                    //                         heading:
                                                    //                             'Owner Name',
                                                    //                         text: snapshot
                                                    //                             .data![index]
                                                    //                             .ownername
                                                    //                             .toString()),
                                                    //                     DetailShownDialogBox(
                                                    //                         icon:
                                                    //                             'assets/contactsvg.svg',
                                                    //                         heading:
                                                    //                             'Owner Mobile No',
                                                    //                         text: snapshot
                                                    //                             .data![index]
                                                    //                             .ownermobileno
                                                    //                             .toString()),
                                                    //                     DetailShownDialogBox(
                                                    //                         icon:
                                                    //                             'assets/contactsvg.svg',
                                                    //                         heading:
                                                    //                             'Owner Address',
                                                    //                         text: snapshot
                                                    //                             .data![index]
                                                    //                             .owneraddress
                                                    //                             .toString())
                                                    //                   ],
                                                    //                 );
                                                    //               },
                                                    //             ),
                                                    //           ),
                                                    //         ],
                                                    //       );
                                                    //     },
                                                    //   ),
                                                    // ]
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: ResidentsNGateKeeperViewCard(
                                    image: Api.imageBaseUrl +
                                        snapshot.data![index].image
                                            .toString(),
                                    name: snapshot.data![index].firstname
                                            .toString() +
                                        " " +
                                        snapshot.data![index].lastname
                                            .toString(),
                                    mobileno: snapshot.data![index].mobileno
                                        .toString(),
                                    showButton: false,
                                  ));
                            },
                            itemCount: snapshot.data!.length,
                          );
                        } else {
                          return Center(
                              child: Text(
                            'No Residents',
                            style: GoogleFonts.ubuntu(
                                color: HexColor('#404345'),
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.0015,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
