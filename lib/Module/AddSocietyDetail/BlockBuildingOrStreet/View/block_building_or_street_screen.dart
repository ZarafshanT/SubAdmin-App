import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';


import '../Controller/block_building_or_street_controller.dart';

class BlockBuildingOrStreet extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockBuildingOrStreetController>(
        init: BlockBuildingOrStreetController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(blocks, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Street Or Building',
                  onTap: () {
                    Get.offAndToNamed(blocks, arguments: controller.user);
                  },
                ),
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 35,
                            mainAxisSpacing: 15),
                        children: [
                          GestureDetector(
                            onTap: () async {

                              if (controller.user.structureType == 2) {
                                Get.offAndToNamed(streets, arguments: [
                                  controller.user,
                                  controller.bid
                                ]);
                              } else if (controller.user.structureType == 3) {
                                Get.offAndToNamed(streets, arguments: [
                                  controller.user,
                                  controller.bid,
                                  controller.phaseid
                                ]);
                              }
                            },
                            child: Card(
                              elevation: 1.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            HexColor('#FFFFFF'),
                                            HexColor('#FF9900')
                                          ]),
                                    ),
                                    child: Image(
                                        image:
                                            AssetImage('assets/phasepic.png')),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Add Streets',
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,

                                        // color: secondaryColor,

                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: HexColor('#FF9900')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              Get.offAndToNamed(blockbuilding,
                                  arguments: [controller.user, controller.bid]);
                            },
                            child: Card(
                              elevation: 1.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            HexColor('#FFFFFF'),
                                            HexColor('#FF9900')
                                          ]),
                                    ),
                                    child: Image(
                                        image:
                                            AssetImage('assets/phasepic.png')),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Add Buildings',
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,

                                        // color: secondaryColor,

                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: HexColor('#FF9900')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ])),
            ),
          );
        });
  }
}
