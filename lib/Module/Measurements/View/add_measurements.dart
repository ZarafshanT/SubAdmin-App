import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Measurements/Controller/add_measurements_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import 'package:societyadminapp/Widgets/ReusableTextWidget/custom_text.dart';
import 'package:societyadminapp/Widgets/ReusableTextWidget/propertyType.dart';
import 'package:societyadminapp/Widgets/ReusableTextWidget/textstyle.dart';

import '../../../Constants/constants.dart';

class AddMeasurements extends GetView {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('build');
    return GetBuilder<AddMeasurementController>(
        init: AddMeasurementController(),
        builder: (controller) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                await Get.offNamed(measurementview, arguments: controller.user);

                return true;
              },
              child: Scaffold(
                body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyBackButton(
                            text: 'Add Measurement',
                            onTap: () {
                              Get.offNamed(measurementview,
                                  arguments: controller.user);
                            }),
                        30.ph,
                        Padding(
                          padding: EdgeInsets.only(left: 23.w, right: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                  text: 'Add Measurements Below:',
                                  style: textStyle(16, Color(0xFFFFA115),
                                      FontWeight.w600, FontStyle.normal)),
                              22.ph,
                              PropertyType(
                                text: 'Property Type',
                              ),
                              8.ph,
                              Container(
                                width: 328.w,
                                height: 52.h,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xFFE1E3E6)),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                      hint: ReusableText(
                                          text: 'Property Type',
                                          style: textStyle(
                                              14,
                                              Color(0xFFA2A7AF),
                                              FontWeight.w600,
                                              FontStyle.normal)),
                                      icon: SvgPicture.asset(
                                          'assets/arrow-down.svg'),
                                      onTap: () {
                                        controller.measurements_types.clear();
                                        controller.unitVal = null;
                                      },
                                      isExpanded: true,
                                      value: controller.propertyVal,
                                      items: controller.property_types
                                          .map<DropdownMenuItem<String>>(
                                              (String e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e.toString())))
                                          .toList(),
                                      onChanged: (val) {
                                        controller.setPropertyVal(val);
                                        print(controller.propertyVal);

                                        if (controller.propertyVal == 'house') {
                                          controller.measurements_types.clear();
                                          controller.measurements_types
                                              .addAll(['marla', 'kanal']);
                                          controller.clearText();
                                        } else if (controller.propertyVal ==
                                            'apartment') {
                                          controller.measurements_types.clear();
                                          controller.measurements_types
                                              .add('sqft');
                                          controller.clearText();
                                        }
                                      }),
                                ),
                              ),
                              16.ph,
                              PropertyType(text: 'Unit Type'),
                              8.ph,
                              Container(
                                width: 328.w,
                                height: 52.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xFFE1E3E6)),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                      icon: SvgPicture.asset(
                                          'assets/arrow-down.svg'),
                                      hint: ReusableText(
                                          text: 'Unit Type',
                                          style: textStyle(
                                              14,
                                              Color(0xFFA2A7AF),
                                              FontWeight.w600,
                                              FontStyle.normal)),
                                      isExpanded: true,
                                      value: controller.unitVal,
                                      items: controller.measurements_types
                                          .map<DropdownMenuItem<String>>(
                                              (String e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e.toString())))
                                          .toList(),
                                      onChanged: (val) {
                                        controller.setMeasurementVal(val);
                                        print(controller.unitVal);

                                        if (controller.unitVal != null) {
                                          controller.setArea();
                                          controller.unitLabel =
                                              controller.unitVal;
                                        }
                                      }),
                                ),
                              ),
                              16.ph,
                              PropertyType(text: 'Services Charges'),
                              8.ph,
                              MyTextFormField(
                                hintText: 'Charges',
                                hintstyle: textStyle(14, Color(0xFFA2A7AF),
                                    FontWeight.w600, FontStyle.normal),
                                fillColor: Colors.white,
                                fill: true,
                                height: 52.h,
                                width: 328.w,
                                borderRadius: 16.r,
                                controller: controller.chargesController,
                                validator: emptyStringValidator,
                                keyboard: TextInputType.number,
                              ),
                              16.ph,
                              PropertyType(text: 'Late Charges'),
                              8.ph,
                              MyTextFormField(
                                hintText: 'Late Charges',
                                hintstyle: textStyle(14, Color(0xFFA2A7AF),
                                    FontWeight.w600, FontStyle.normal),
                                fillColor: Colors.white,
                                fill: true,
                                height: 52.h,
                                width: 328.w,
                                borderRadius: 16.r,
                                controller: controller.lateChargesController,
                                validator: emptyStringValidator,
                                keyboard: TextInputType.number,
                              ),
                              16.ph,
                              PropertyType(text: 'App Charges'),
                              8.ph,
                              MyTextFormField(
                                hintText: 'App Charges',
                                hintstyle: textStyle(14, Color(0xFFA2A7AF),
                                    FontWeight.w600, FontStyle.normal),
                                fillColor: Colors.white,
                                fill: true,
                                height: 52.h,
                                width: 328.w,
                                borderRadius: 16.r,
                                controller: controller.appChargesController,
                                validator: emptyStringValidator,
                                keyboard: TextInputType.number,
                              ),
                              16.ph,
                              PropertyType(text: 'Tax'),
                              8.ph,
                              MyTextFormField(
                                hintText: 'Tax',
                                hintstyle: textStyle(14, Color(0xFFA2A7AF),
                                    FontWeight.w600, FontStyle.normal),
                                fillColor: Colors.white,
                                fill: true,
                                height: 52.h,
                                width: 328.w,
                                borderRadius: 16.r,
                                controller: controller.taxController,
                                validator: emptyStringValidator,
                                keyboard: TextInputType.number,
                              ),
                              16.ph,
                              controller.isArea
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          PropertyType(
                                              text: controller.unitLabel!),
                                          8.ph,
                                          MyTextFormField(
                                            hintText: controller.unitLabel,
                                            hintstyle: textStyle(
                                                14,
                                                Color(0xFFA2A7AF),
                                                FontWeight.w600,
                                                FontStyle.normal),
                                            fillColor: Colors.white,
                                            fill: true,
                                            height: 52.h,
                                            width: 328.w,
                                            borderRadius: 16.r,
                                            controller:
                                                controller.areaController,
                                            validator: emptyStringValidator,
                                            keyboard: TextInputType.number,
                                          ),
                                        ])
                                  : Container(),
                              29.ph,
                              Center(
                                  child: MyButton(
                                height: 52.h,
                                width: 328.w,
                                name: 'Add',
                                onPressed: controller.isLoading
                                    ? null
                                    : () async {
                                        if (controller.propertyVal == null) {
                                          Get.snackbar('Required',
                                              'Select Property Type');
                                        } else if (controller.unitVal == null) {
                                          Get.snackbar(
                                              'Required', 'Select Unit Type');
                                        } else {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await controller.addMeasurementApi(
                                                userid: controller.user.userid!,
                                                bearerToken: controller
                                                    .user.bearerToken
                                                    .toString(),
                                                propertyType:
                                                    controller.propertyVal!,
                                                charges: controller
                                                    .chargesController.text,
                                                unitType: controller.unitVal!,
                                                area: controller
                                                    .areaController.text,
                                                appCharges: controller
                                                    .appChargesController.text,
                                                lateCharges: controller
                                                    .lateChargesController.text,
                                                tax: controller
                                                    .taxController.text);
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          }
                                        }
                                      },
                                textStyle: btntextStyle(20, Colors.white,
                                    FontWeight.w500, FontStyle.normal),
                              )),
                            ],
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
