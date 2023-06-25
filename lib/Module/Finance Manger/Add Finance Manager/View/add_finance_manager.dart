import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/Finance%20Manger/Add%20Finance%20Manager/Controller/add_finance_manager_controller.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../../Widgets/ReusableTextWidget/textstyle.dart';

class AddFinanceManager extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFinanceManagerController>(
        init: AddFinanceManagerController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offNamed(viewFinanceManager,
                  arguments: controller.user);
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            MyBackButton(
                              text: 'Add Finance Manager',
                              onTap: () {
                                Get.offNamed(viewFinanceManager,
                                    arguments: controller.user);
                              },
                            ),
                            31.h.ph,
                            Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: controller.imageFile == null
                                      ? AssetImage('assets/user.png')
                                          as ImageProvider
                                      : FileImage(
                                          File(controller.imageFile!.path),
                                        ),
                                ),
                                Positioned(
                                  left: 70,
                                  top: 70,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 100.0,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 20),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'Choose Profile Photo',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(height: 20),
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
                                                          controller
                                                              .getFromCamera(
                                                                  ImageSource
                                                                      .camera);
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
                                                          controller
                                                              .getFromGallery(
                                                                  ImageSource
                                                                      .gallery);
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
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            MyTextFormField(
                              controller: controller.firstNameController,
                              validator: emptyStringValidator,
                              hintText: 'First Name',
                              labelText: 'Enter First Name',
                            ),
                            MyTextFormField(
                              controller: controller.lastNameController,
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
                              controller: controller.mobileNoController,
                              validator: emptyStringValidator,
                              hintText: 'Mobile No',
                              labelText: 'Enter Mobile No ',
                            ),
                            MyPasswordTextFormField(
                              maxLines: 1,
                              controller: controller.passwordController,
                              obscureText: controller.isHidden,
                              togglePasswordView: controller.togglePasswordView,
                              validator: emptyStringValidator,
                              hintText: 'Password',
                              labelText: 'Password',
                            ),
                            MyButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  if (!controller.isLoading) {
                                    controller.financeManagerRegisterApi(
                                        firstName:
                                            controller.firstNameController.text,
                                        lastName:
                                            controller.lastNameController.text,
                                        cnic: controller.cnicController.text,
                                        address:
                                            controller.addressController.text,
                                        mobileNo:
                                            controller.mobileNoController.text,
                                        password:
                                            controller.passwordController.text,
                                        societyid: controller.user.societyid!,
                                        subAdminId: controller.user.userid!,
                                        superAdminId:
                                            controller.user.superadminid!,
                                        token: controller.user.bearerToken!,
                                        file: controller.imageFile,
                                        context: context);
                                  }
                                }
                              },
                              loading: controller.isLoading,
                              name: 'Save',
                              textStyle: btntextStyle(20, Colors.white,
                                  FontWeight.w500, FontStyle.normal),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     if (controller.formKey.currentState!
                            //         .validate()) {
                            //       controller.addAdminApi(
                            //           firstName:
                            //               controller.firstNameController.text,
                            //           lastName:
                            //               controller.lastNameController.text,
                            //           cnic: controller.cnicController.text,
                            //           address:
                            //               controller.addressController.text,
                            //           mobileNo:
                            //               controller.mobileNoController.text,
                            //           password:
                            //               controller.passwordController.text,
                            //           societyid: controller.user.societyid!,
                            //           subAdminId: controller.user.userid!,
                            //           superAdminId:
                            //               controller.user.superadminid!,
                            //           token: controller.user.bearerToken!,
                            //           file: controller.imageFile);
                            //     }
                            //   },
                            //   child: controller.isLoading
                            //       ? CircularProgressIndicator()
                            //       : Text('Add'),
                            // )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}
