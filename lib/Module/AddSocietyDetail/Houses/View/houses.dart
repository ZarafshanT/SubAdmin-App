import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Houses/Controller/houses_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../../Widgets/Loader/loader.dart';

class Houses extends GetView<HouseController> {
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseController>(
        init: HouseController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 5) {
                await Get.offNamed(
                    structureType5HouseOrBuildingMiddlewareScreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 1) {
                await Get.offNamed(streets, arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                await Get.offNamed(streets,
                    arguments: [controller.user, controller.blockid]);
              } else if (controller.user.structureType == 3) {
                await Get.offNamed(streets, arguments: [
                  controller.user,
                  controller.blockid,
                  controller.phaseid
                ]);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        if (controller.user.structureType == 5) {
                          Get.offNamed(addhouses, arguments: controller.user);
                        } else if (controller.user.structureType == 1) {
                          Get.offNamed(addhouses, arguments: [
                            controller.user,
                            controller.streetid
                          ]);
                        } else if (controller.user.structureType == 2) {
                          Get.offNamed(addhouses, arguments: [
                            controller.user,
                            controller.streetid,
                            controller.blockid
                          ]);
                        } else if (controller.user.structureType == 3) {
                          Get.offNamed(addhouses, arguments: [
                            controller.user,
                            controller.streetid,
                            controller.blockid,
                            controller.phaseid
                          ]);
                        }

                        // Get.offAndToNamed(addblocks,arguments: [controller.pid,controller.bearerToken]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Houses',
                        onTap: () {
                          if (controller.user.structureType == 5) {
                            Get.offNamed(
                                structureType5HouseOrBuildingMiddlewareScreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 1) {
                            Get.offNamed(streets, arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offNamed(streets, arguments: [
                              controller.user,
                              controller.blockid
                            ]);
                          } else if (controller.user.structureType == 3) {
                            Get.offNamed(streets, arguments: [
                              controller.user,
                              controller.blockid,
                              controller.phaseid
                            ]);
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Expanded(
                          child:
                              // (controller.structuretype == 2 ||
                              //         controller.structuretype == 3 ||
                              //         controller.structuretype == 4)
                              //     ?
                              FutureBuilder(
                                  future: (controller.user.structureType == 5)
                                      ? controller.housesApi(
                                          dynamicid: controller.user.societyid!,
                                          bearerToken:
                                              controller.user.bearerToken!)
                                      : controller.housesApi(
                                          dynamicid: controller.streetid,
                                          bearerToken:
                                              controller.user.bearerToken!),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data != null &&
                                          snapshot.data.data.length != 0) {
                                        return ListView.builder(
                                          itemCount: snapshot.data.data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return SizedBox(
                                              height: 64,
                                              width: 324,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                color: HexColor('#F3F3F3'),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          24, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 43,
                                                        width: 43,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.14),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/house1.png'))),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        snapshot
                                                                .data
                                                                .data[index]
                                                                .address
                                                                .toString() ,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                // color: secondaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 18,
                                                                color: HexColor(
                                                                    '#4D4D4D')),
                                                      ),
                                                      SizedBox(
                                                        width: 132,
                                                      ),
                                                      Image.asset(
                                                          'assets/arrowfrwd.png')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return EmptyList(name: 'No Houses');
                                      }
                                    } else if (snapshot.hasError) {
                                      return Icon(Icons.error_outline);
                                    } else {
                                      return Loader();
                                    }
                                  })),
                      // FutureBuilder(
                      //     future: controller.housesApi(
                      //         dynamicid: controller.user.societyid!,
                      //         bearerToken:
                      //             controller.user.bearerToken!),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot snapshot) {
                      //       if (snapshot.hasData) {
                      //         if (snapshot.data != null &&
                      //             snapshot.data.data.length != 0) {
                      //           return ListView.builder(
                      //             itemCount: snapshot.data.data.length,
                      //             itemBuilder: (BuildContext context,
                      //                 int index) {
                      //               return SizedBox(
                      //                 height: 64,
                      //                 width: 324,
                      //                 child: Card(
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(
                      //                             10.0),
                      //                   ),
                      //                   color: HexColor('#F3F3F3'),
                      //                   child: Padding(
                      //                     padding:
                      //                         const EdgeInsets.fromLTRB(
                      //                             24, 0, 0, 0),
                      //                     child: Row(
                      //                       children: [
                      //                         Container(
                      //                           height: 43,
                      //                           width: 43,
                      //                           decoration: BoxDecoration(
                      //                               shape:
                      //                                   BoxShape.circle,
                      //                               color:
                      //                                   Color.fromRGBO(
                      //                                       255,
                      //                                       153,
                      //                                       0,
                      //                                       0.14),
                      //                               image: DecorationImage(
                      //                                   image: AssetImage(
                      //                                       'assets/house1.png'))),
                      //                         ),
                      //                         SizedBox(
                      //                           width: 20,
                      //                         ),
                      //                         Text(
                      //                           snapshot
                      //                                   .data
                      //                                   .data[index]
                      //                                   .address
                      //                                   .toString() +
                      //                               " " +
                      //                               snapshot
                      //                                   .data
                      //                                   .data[index]
                      //                                   .iteration
                      //                                   .toString(),
                      //                           style:
                      //                               GoogleFonts.ubuntu(
                      //                                   fontStyle:
                      //                                       FontStyle
                      //                                           .normal,
                      //                                   // color: secondaryColor,
                      //                                   fontWeight:
                      //                                       FontWeight
                      //                                           .w500,
                      //                                   fontSize: 18,
                      //                                   color: HexColor(
                      //                                       '#4D4D4D')),
                      //                         ),
                      //                         SizedBox(
                      //                           width: 132,
                      //                         ),
                      //                         Image.asset(
                      //                             'assets/arrowfrwd.png')
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               );
                      //             },
                      //           );
                      //         } else {
                      //           return EmptyList(name: 'No Houses');
                      //         }
                      //       } else if (snapshot.hasError) {
                      //         return Icon(Icons.error_outline);
                      //       } else {
                      //         return Loader();
                      //       }
                      //     })),
                    ],
                  )),
            ),
          );
        });
  }
}
