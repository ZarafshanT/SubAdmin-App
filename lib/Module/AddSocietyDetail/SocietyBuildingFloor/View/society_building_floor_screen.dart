import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Loader/loader.dart';

import '../Controller/society_building_floor_controller.dart';

class SocietyBuildingFloorsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyBuildingFloorsController>(
        init: SocietyBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 1) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 3) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 5) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
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
                        Get.offAndToNamed(addsocietybuildingfloors, arguments: [
                          controller.user,
                          controller.buildingid!
                        ]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Floors',
                        onTap: () {
                          if (controller.user.structureType == 1) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 3) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 5) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Expanded(
                          child: FutureBuilder(
                              future: controller.FloorsApi(
                                  buildingid: controller.buildingid!,
                                  token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 80,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.offAndToNamed(
                                                societybuildingapartmentscreen,
                                                arguments: [
                                                  controller.user,
                                                  snapshot.data.data[index].id,
                                                  controller.buildingid
                                                ]);
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 38),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      snapshot
                                                          .data.data[index].name
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          // color: secondaryColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                          color: HexColor(
                                                              '#4D4D4D')),
                                                    ),
                                                    SizedBox(
                                                      width: 212,
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
