import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:societyadminapp/Constants/constants.dart';

import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';

import '../Controller/block_building_controller.dart';

class BlockBuilding extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockBuildingController>(
        init: BlockBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 2) {
                Get.offAndToNamed(blockbuildingorstreet,
                    arguments: [controller.user, controller.bid]);
              } else {
                Get.offAndToNamed(phasebuildingorblock,
                    arguments: [controller.user, controller.pid]);
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
                        if (controller.user.structureType == 2) {
                          Get.offAndToNamed(addblockbuildingscreen,
                              arguments: [controller.user, controller.bid]);
                        } else {
                          Get.offAndToNamed(addblockbuildingscreen,
                              arguments: [controller.user, controller.pid]);
                        }
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Buildings',
                        onTap: () {
                          if (controller.user.structureType == 2) {
                            Get.offAndToNamed(blockbuildingorstreet,
                                arguments: [controller.user, controller.bid]);
                          } else {
                            Get.offAndToNamed(phasebuildingorblock,
                                arguments: [controller.user, controller.pid]);
                          }
                        },
                      ),
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 2)
                                  ? controller.SocietyBuildingApi(
                                      dynamicid: controller.bid,
                                      token: controller.user.bearerToken!)
                                  : controller.SocietyBuildingApi(
                                      dynamicid: controller.pid,
                                      token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Expanded(
                                        child: GridView.builder(
                                          padding: EdgeInsets.only(
                                              left: 28, right: 27),
                                          itemCount: snapshot.data.data.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 35,
                                                  mainAxisSpacing: 15),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // controller.setNoOfPhases(snapshot.data.noofphases.toString());
                                            // controller.noofphases= snapshot.data.noofphases.toString();
                                            return GestureDetector(
                                              onTap: () async {
                                                print(
                                                    'buidling id ${snapshot.data.data[index].id}');

                                                print(
                                                    'phase id ${snapshot.data.data[index].dynamicid}');

                                                Get.offAndToNamed(
                                                    blockorphasebuildingfloorsscreen,
                                                    arguments: [
                                                      controller.user,
                                                      snapshot
                                                          .data.data[index].id,
                                                      snapshot.data.data[index]
                                                          .dynamicid,
                                                    ]);
                                              },
                                              child: Card(
                                                elevation: 1.5,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              HexColor(
                                                                  '#FFFFFF'),
                                                              HexColor(
                                                                  '#FF9900')
                                                            ]),
                                                      ),
                                                      child: Image(
                                                          image: AssetImage(
                                                              'assets/phasepic.png')),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      snapshot.data.data[index]
                                                          .societybuildingname
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,

                                                          // color: secondaryColor,

                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                          color: HexColor(
                                                              '#FF9900')),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
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
