import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Controller/block_controller.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';

import '../../../../Widgets/Loader/loader.dart';

class Blocks extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlocksController>(
        init: BlocksController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 2) {
                Get.offNamed(blockorsocietybuilding,
                    arguments: controller.user);
              } else {
                Get.offNamed(phasebuildingorblock,
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
                        if (controller.user.structureType == 2) {
                          Get.offNamed(addblocks, arguments: controller.user);
                        } else if (controller.user.structureType == 3) {
                          Get.offNamed(addblocks,
                              arguments: [controller.user, controller.phaseid]);
                        }
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Blocks',
                        onTap: () {
                          if (controller.user.structureType == 2) {
                            Get.offNamed(blockorsocietybuilding,
                                arguments: controller.user);
                          } else {
                            Get.offNamed(phasebuildingorblock, arguments: [
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
                              future: (controller.user.structureType == 2)
                                  ? controller.blocksApi(
                                      dynamicid: controller.user.societyid!,
                                      bearerToken: controller.user.bearerToken!)
                                  : controller.blocksApi(
                                      dynamicid: controller.phaseid!,
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
                                              
                                              //pid        print( snapshot.data.data[index].pid);

                                              if (controller
                                                      .user.structureType ==
                                                  2) {
                                                Get.offNamed(
                                                    blockbuildingorstreet,
                                                    arguments: [
                                                      controller.user,
                                                      snapshot
                                                          .data.data[index].id
                                                    ]);
                                              } else {
                                                Get.offNamed(streets,
                                                    arguments: [
                                                      controller.user,
                                                      snapshot
                                                          .data.data[index].id,
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
                                  } else {
                                    return EmptyList(
                                      name: 'No Blocks',
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              })),
                    ],
                  )),
            ),
          );
        });
  }
}
