import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../Controller/add_local_building_apartment_controller.dart';

class AddLocalBuildingApartmentsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddLocalBuildingApartmentsController>(
        init: AddLocalBuildingApartmentsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(localbuildingapartmentscreen,
                  arguments: [controller.user, controller.fid]);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: <Widget>[
                        MyBackButton(
                          text: 'Add Apartments',
                          onTap: () {
                            Get.offAndToNamed(localbuildingapartmentscreen,
                                arguments: [controller.user, controller.fid]);
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
                                  Text('From Apartment'),
                                  Text('To Apartment'),
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
                            controller.addApartmentsApi(
                              bearerToken: controller.user.bearerToken!,
                              from: controller.fromController.text.toString(),
                              to: controller.toController.text.toString(),
                              fid: controller.fid!,
                            );
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
