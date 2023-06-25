import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Blocks/Controller/add_block_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../Controller/add_socuety_buildings_controller.dart';

class AddSocietyBuildingScreen extends GetView {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSocietyBuildingController>(
        init: AddSocietyBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(societybuildingscreen,
                  arguments: controller.user);

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
                          onTap: () {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          },
                          text: 'Add Society Building',
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 244,
                          width: 299,
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 28, left: 27),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 27),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Color(0xFFF7F8FA),
                                          height: 35,
                                          width: 150,
                                          child: Center(
                                              child: Text(
                                            'Society Building Name',
                                            style: TextStyle(
                                                color: HexColor('#535353')),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 38),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38),
                                        child: Container(
                                          width: 200,
                                          height: 75,
                                          color:
                                              Color.fromRGBO(255, 153, 0, 0.14),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/blockfieldpic.png')),
                                              ),
                                              Center(
                                                child: TextFormField(
                                                  validator:
                                                      emptyStringValidator,
                                                  controller: controller
                                                      .societyBuildingNameController,
                                                  enabled: true,
                                                  decoration: InputDecoration(
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            BorderSide(), //<-- SEE HERE
                                                      ),
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 72,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MyButton(
                                  height: 37,
                                  width: 222,
                                  border: 5,
                                  onPressed: () {
                                    // print(controller.user.userid);
                                    // print(controller.user.bearerToken);
                                    String type;
                                    if (controller.user.structureType == 1) {
                                      type = 'street society building';
                                    } else if (controller.user.structureType ==
                                        2) {
                                      type = 'block society building';
                                    } else {
                                      type = 'phase society building';
                                    }

                                    controller.addSocietyBuildingApi(
                                        dynamicid: controller.user.societyid!,
                                        societyid: controller.user.societyid!,
                                        subadminid: controller.user.userid!,
                                        superadminid:
                                            controller.user.superadminid!,
                                        bearerToken:
                                            controller.user.bearerToken!,
                                        BuildingName: controller
                                            .societyBuildingNameController.text
                                            .toString(),
                                        type: type);
                                  },
                                  name: 'Save',
                                  textStyle: btntextStyle(20, Colors.white,
                                      FontWeight.w500, FontStyle.normal),
                                )
                              ],
                            ),
                          ),
                        ),
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
