import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/AddGateKepeer/Controller/add_gate_kepeer_controller.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../../../Widgets/UpIcon/up_icon.dart';

class AddGateKeeper extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AddGateKepeerScreenController>(
          init: AddGateKepeerScreenController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: () async {
                Get.offNamed(gatekeeperscreen, arguments: controller.user);

                return true;
              },
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyBackButton(
                          text: 'Add Gatekeeper',
                          onTap: () {
                            Get.offNamed(gatekeeperscreen,
                                arguments: controller.user);
                          },
                        ),
                        25.35.ph,
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50.0.r,
                              backgroundColor: Colors.white,
                              backgroundImage: controller.imageFile == null
                                  ? AssetImage('assets/user.png')
                                      as ImageProvider
                                  : FileImage(
                                      File(controller.imageFile!.path),
                                    ),
                            ),
                            Positioned(
                              left: 65.w,
                              top: 65.h,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 100.0.h,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 20.w),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Choose Profile Photo',
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(20)),
                                              ),
                                              20.ph,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  ElevatedButton.icon(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                primaryColor),
                                                    icon: Icon(
                                                      Icons.camera,
                                                    ),
                                                    onPressed: () {
                                                      controller.getFromCamera(
                                                          ImageSource.camera);
                                                    },
                                                    label: Text('Camera'),
                                                  ),
                                                  ElevatedButton.icon(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                primaryColor),
                                                    icon: Icon(Icons.image),
                                                    onPressed: () {
                                                      controller.getFromGallery(
                                                          ImageSource.gallery);
                                                    },
                                                    label: Text('Gallery'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Icon(
                                  Icons.camera_alt,
                                  color: primaryColor,
                                  size: 30.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        31.96.ph,
                        MyTextFormField(
                          controller: controller.fnameController,
                          validator: emptyStringValidator,
                          hintText: 'First Name',
                          labelText: 'Enter First Name',
                        ),
                        MyTextFormField(
                          controller: controller.lnameController,
                          validator: emptyStringValidator,
                          hintText: 'Last Name',
                          labelText: 'Enter Last Name',
                        ),
                        MyTextFormField(
                          textInputType: TextInputType.number,
                          controller: controller.cnicController,
                          validator: emptyStringValidator,
                          hintText: 'Cnic',
                          labelText: 'Enter Cnic ',
                        ),
                        MyTextFormField(
                          controller: controller.addressController,
                          validator: emptyStringValidator,
                          hintText: 'Address',
                          labelText: 'Enter Address ',
                        ),
                        MyTextFormField(
                          textInputType: TextInputType.number,
                          controller: controller.mobilenoController,
                          validator: emptyStringValidator,
                          hintText: 'Mobile No',
                          labelText: 'Enter Mobile No ',
                        ),
                        MyTextFormField(
                          textInputType: TextInputType.number,
                          controller: controller.gatenoController,
                          validator: emptyStringValidator,
                          hintText: 'Gate No',
                          labelText: 'Enter Gate No ',
                        ),
                        MyPasswordTextFormField(
                          maxLines: 1,
                          controller: controller.passwordController,
                          obscureText: controller.isHidden,
                          togglePasswordView: controller.togglePasswordView,
                          validator: emptyStringValidator,
                          hintText: 'Enter Password',
                          labelText: 'Password',
                        ),
                        56.ph,
                        MyButton(
                          onPressed: controller.isLoading
                              ? null
                              : () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    if (controller.imageFile?.path == null) {
                                      Get.snackbar(
                                          'Warning', 'Select an image !');
                                    } else {
                                      controller.addGateKeeperApi(
                                          file: controller.imageFile!,
                                          fname:
                                              controller.fnameController.text,
                                          lname:
                                              controller.lnameController.text,
                                          cnic: controller.cnicController.text,
                                          address:
                                              controller.addressController.text,
                                          mobileno: controller
                                              .mobilenoController.text,
                                          gateno:
                                              controller.gatenoController.text,
                                          password: controller
                                              .passwordController.text,
                                          bearerToken:
                                              controller.user!.bearerToken!,
                                          subadminid: controller.user!.userid!,
                                          societyid:
                                              controller.user!.societyid!);
                                    }
                                  }
                                },
                          name: 'Save',
                          outlinedBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0.r),
                          ),
                          textStyle: btntextStyle(20, Colors.white,
                              FontWeight.w500, FontStyle.normal),
                        ),
                        32.ph,
                        UpIcon(),
                        18.2.ph,
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
