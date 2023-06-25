import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../Controller/add_block_or_phase_building_floors_controller.dart';

class AddBlockOrPhaseBuildingFloors extends GetView {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AAddBlockOrPhaseBuildingFloorsController>(
        init: AAddBlockOrPhaseBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(blockorphasebuildingfloorsscreen, arguments: [
                controller.user,
                controller.buildingid,
                controller.dynamicid
              ]);

              return false;
            },
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        MyBackButton(
                          text: 'Add Floors',
                          onTap: () {
                            Get.offAndToNamed(blockorphasebuildingfloorsscreen,
                                arguments: [
                                  controller.user,
                                  controller.buildingid,
                                  controller.dynamicid
                                ]);
                          },
                        ),
                        SizedBox(height: 20),
                        Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('From Floors'),
                                  Text('To Floors'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 70,
                                      child: TextFormField(
                                        validator: emptyStringValidator,
                                        controller: controller.fromController,
                                        keyboardType: TextInputType.number,
                                        enabled: true,
                                        decoration: InputDecoration(
                                            filled: true,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide:
                                                  BorderSide(), //<-- SEE HERE
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 70,
                                      child: TextFormField(
                                        validator: emptyStringValidator,
                                        controller: controller.toController,
                                        keyboardType: TextInputType.number,
                                        enabled: true,
                                        decoration: InputDecoration(
                                            filled: true,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide:
                                                  BorderSide(), //<-- SEE HERE
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        MyButton(
                          onPressed: () {
                            // print(controller.user.userid);
                            // print(controller.user.bearerToken);

                            controller.addSocietybuildingFloorsApi(
                                bearerToken: controller.user.bearerToken!,
                                from: controller.fromController.text.toString(),
                                to: controller.toController.text.toString(),
                                buildingid: controller.buildingid!);
                          },
                          name: 'Save',
                          textStyle: btntextStyle(20, Colors.white,
                              FontWeight.w500, FontStyle.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
