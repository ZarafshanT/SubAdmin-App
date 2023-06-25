import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/Controller/street_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../../Widgets/Loader/loader.dart';

class Street extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StreetsController>(
        init: StreetsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 1) {
                await Get.offNamed(streetorbuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                await Get.offNamed(blockbuildingorstreet,
                    arguments: [controller.user, controller.blockid]);
              } else if (controller.user.structureType == 3) {
                await Get.offNamed(blocks,
                    arguments: [controller.user, controller.phaseid]);
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
                        if (controller.user.structureType == 1) {
                          Get.offNamed(addstreets, arguments: controller.user);
                        } else if (controller.user.structureType == 2) {
                          Get.offNamed(addstreets, arguments: [
                            controller.user,
                            controller.blockid,
                          ]);
                        } else if (controller.user.structureType == 3) {
                          Get.offNamed(addstreets, arguments: [
                            controller.user,
                            controller.blockid,
                            controller.phaseid,
                          ]);
                        }
                        // Get.offAndToNamed(addblocks,arguments: [controller.pid,controller.bearerToken]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Streets',
                        onTap: () {
                          if (controller.user.structureType == 1) {
                            Get.offNamed(streetorbuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offNamed(blockbuildingorstreet, arguments: [
                              controller.user,
                              controller.blockid
                            ]);
                          } else if (controller.user.structureType == 3) {
                            Get.offNamed(blocks, arguments: [
                              controller.user,
                              controller.phaseid
                            ]);
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 1)
                                  ? controller.streetsApi(
                                      dynamicid: controller.user.societyid!,
                                      bearerToken: controller.user.bearerToken!)
                                  : controller.streetsApi(
                                      dynamicid: controller.blockid,
                                      bearerToken:
                                          controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data != null &&
                                      snapshot.data.data.length != 0) {
                                    return ListView.builder(
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 80,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (controller
                                                      .user.structureType ==
                                                  1) {
                                                Get.offAndToNamed(houses,
                                                    arguments: [
                                                      controller.user,
                                                      snapshot
                                                          .data.data[index].id
                                                    ]);
                                              } else if (controller
                                                      .user.structureType ==
                                                  2) {
                                                Get.offAndToNamed(houses,
                                                    arguments: [
                                                      controller.user,
                                                      snapshot
                                                          .data.data[index].id,
                                                      controller.blockid
                                                    ]);
                                              } else if (controller
                                                      .user.structureType ==
                                                  3) {
                                                Get.offAndToNamed(houses,
                                                    arguments: [
                                                      controller.user,
                                                      snapshot
                                                          .data.data[index].id,
                                                      controller.blockid,
                                                      controller.phaseid
                                                    ]);
                                              }
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 38),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 18,
                                                        width: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: HexColor(
                                                                    '#EFEFEF')),
                                                        child: Center(
                                                          child: Text(
                                                            snapshot.data
                                                                .data[index].id
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 11,
                                                                color: HexColor(
                                                                    '#868686')),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 13,
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
                                                        width: 158,
                                                      ),
                                                      Container(
                                                        height: 21,
                                                        width: 28,
                                                        color: Color.fromRGBO(
                                                            255, 153, 0, 0.24),
                                                        child: Image(
                                                            image: AssetImage(
                                                                'assets/arrowfrwd.png')),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 18,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyList(name: 'No Streets');
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              })),
//                 MyButton(
//                     name: 'Next',
//                     onPressed: controller.isLoading
//                         ? null
//                         : () {
//                             if (controller.formkey.currentState!.validate()) {
// print(controller.myApiData);
//                             } else {
//                               return null;
//                             }
//                           })
                    ],
                  )),
            ),
          );
        });
  }
}
