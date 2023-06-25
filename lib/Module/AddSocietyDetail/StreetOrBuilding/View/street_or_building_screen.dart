import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';


import '../Controller/street_or_building_controller.dart';

class StreetOrBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StreetOrBuildingController>(
        init: StreetOrBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(homescreen, arguments: controller.data);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Street Or Building',
                  onTap: () {
                    Get.offAndToNamed(homescreen, arguments: controller.data);
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
                              Get.offNamed(streets, arguments: controller.data);
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
                                    'Add Street',
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
                             
                              Get.offNamed(societybuildingscreen,
                                  arguments: controller.data);
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
