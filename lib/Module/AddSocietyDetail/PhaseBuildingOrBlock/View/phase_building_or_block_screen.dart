import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';

import '../Controller/phase_building_or_block_controller.dart';

class PhaseBuildingOrBlock extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhaseBuildingOrBlockController>(
        init: PhaseBuildingOrBlockController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(phasess, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Phase Or Building',
                  onTap: () {
                    Get.offAndToNamed(phasess, arguments: controller.user);
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
                              Get.offAndToNamed(blocks,
                                  arguments: [controller.user, controller.pid]);
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
                                    'Add Block',
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
                                  arguments: [controller.user, controller.pid]);
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
