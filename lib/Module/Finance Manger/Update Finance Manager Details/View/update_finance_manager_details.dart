import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/Finance%20Manger/Update%20Finance%20Manager%20Details/Controller/reset_password_controller.dart';
import 'package:societyadminapp/Module/Finance%20Manger/Update%20Finance%20Manager%20Details/Controller/update_finance_manager_detail_controller.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../../Widgets/My Text/my_text.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../../Widgets/ReusableTextWidget/textstyle.dart';

class UpdateFinanceManagerDetails extends StatelessWidget {
  const UpdateFinanceManagerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateFinanceManagerDetailController>(
        init: UpdateFinanceManagerDetailController(),
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
                              text: 'Update Finance Manager Details',
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
                                      ? NetworkImage(Api.imageBaseUrl +
                                          controller.financeManager.image
                                              .toString()) as ImageProvider
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

                            MyButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  if (!controller.isLoading) {
                                    controller.financeManagerUpdateApi(
                                        firstName:
                                            controller.firstNameController.text,
                                        lastName:
                                            controller.lastNameController.text,
                                        address:
                                            controller.addressController.text,
                                        mobileNo:
                                            controller.mobileNoController.text,
                                        financeManagerId: controller
                                            .financeManager.financemanagerid!,
                                        token: controller.user.bearerToken!,
                                        file: controller.imageFile,
                                        context: context);
                                    // controller.addAdminApi(
                                    //     firstName:
                                    //     controller.firstNameController.text,
                                    //     lastName:
                                    //     controller.lastNameController.text,
                                    //     cnic: controller.cnicController.text,
                                    //     address:
                                    //     controller.addressController.text,
                                    //     mobileNo:
                                    //     controller.mobileNoController.text,
                                    //     password:
                                    //     controller.passwordController.text,
                                    //     societyid: controller.user.societyid!,
                                    //     subAdminId: controller.user.userid!,
                                    //     superAdminId:
                                    //     controller.user.superadminid!,
                                    //     token: controller.user.bearerToken!,
                                    //     file: controller.imageFile,
                                    //     context: context);
                                  }
                                }
                              },
                              loading: controller.isLoading,
                              name: 'Update',
                              textStyle: btntextStyle(20, Colors.white,
                                  FontWeight.w500, FontStyle.normal),
                            ),

                            GetBuilder<ResetPasswordController>(
                                init: ResetPasswordController(),
                                builder: (resetPasswordController) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: 'Reset Password',
                                            content: Form(
                                              key: resetPasswordController
                                                  .formKey,
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/reset_password_icon.svg',
                                                    width: 200,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  MyPasswordTextFormField(
                                                      validator:
                                                          emptyStringValidator,
                                                      labelText: 'Password',
                                                      hintText: 'Password',
                                                      togglePasswordView:
                                                          resetPasswordController
                                                              .togglePasswordView,
                                                      controller:
                                                          resetPasswordController
                                                              .passwordController,
                                                      obscureText:
                                                          resetPasswordController
                                                              .isHidden),
                                                  MyButton(
                                                    name: 'Reset Password',
                                                    onPressed: () {
                                                      if (resetPasswordController
                                                          .formKey.currentState!
                                                          .validate()) {
                                                        resetPasswordController.resetPasswordApi(
                                                            financeManagerId:
                                                                controller
                                                                    .financeManager
                                                                    .financemanagerid!,
                                                            bearerToken:
                                                                controller.user
                                                                    .bearerToken!,
                                                            password:
                                                                resetPasswordController
                                                                    .passwordController
                                                                    .text);
                                                      }
                                                    },
                                                    textStyle: btntextStyle(
                                                        20,
                                                        Colors.white,
                                                        FontWeight.w500,
                                                        FontStyle.normal),
                                                  )
                                                ],
                                              ),
                                            ));
                                      },
                                      child: Wrap(
                                        children: [
                                          MyText(name: 'Reset Password')
                                        ],
                                      ));
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
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
