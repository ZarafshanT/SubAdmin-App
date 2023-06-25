import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/residential_emergency_controller.dart';

class ResidentialEmergencyScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentialEmergencyController>(
        init: ResidentialEmergencyController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Emergency',
                        onTap: () {
                          Get.offNamed(homescreen,
                              arguments: controller.userdata);
                        },
                      ),
                      Expanded(
                        child: FutureBuilder(
                            future: controller.viewEmergencyApi(
                                controller.userdata.userid!,
                                controller.userdata.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              print(snapshot);
                              if (snapshot.hasData) {
                                print(snapshot.hasData);
                                if (snapshot.data.data != null &&
                                    snapshot.data.data!.length != 0) {
                                  return ListView.builder(
                                      itemBuilder: (context, index) {
                                        if (snapshot.data.data[index].status ==
                                            0) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 13, 22, 0),
                                            child: SizedBox(
                                              width: 343,
                                              height: 90,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 13, 0, 0),
                                                      child: Text(
                                                          snapshot
                                                              .data
                                                              .data[index]
                                                              .description
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            color: HexColor(
                                                                '#606470'),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          )),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                13, 34, 0, 0),
                                                        child: Text.rich(
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text:
                                                                'Description :',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot
                                                                .data
                                                                .data[index]
                                                                .description
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              color: HexColor(
                                                                  '#606470'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ]))),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                13, 54, 0, 0),
                                                        child: Text.rich(
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text: 'Name :',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .resident
                                                                    .first
                                                                    .firstname
                                                                    .toString() +
                                                                " " +
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .resident
                                                                    .first
                                                                    .lastname
                                                                    .toString(),
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              color: HexColor(
                                                                  '#606470'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ]))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Center(
                                            child: Text('Stable'),
                                          );
                                        }
                                      },
                                      itemCount: snapshot.data.data.length);
                                } else {
                                  return Text('Stable');
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
                  )),
            ),
          );
        });
  }
}
