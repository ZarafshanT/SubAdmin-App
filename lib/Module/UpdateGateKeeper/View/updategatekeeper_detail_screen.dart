import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/UpdateGateKeeper/Controller/reset_password_controller.dart';
import 'package:societyadminapp/Widgets/My%20Text/my_text.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../Controller/update_gate_keeper_controller.dart';

class UpdateGateKepeerScreen extends StatefulWidget {
  @override
  State<UpdateGateKepeerScreen> createState() => _UpdateGateKepeerScreenState();
}

class _UpdateGateKepeerScreenState extends State<UpdateGateKepeerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UpdateGateKeeperController>(
            init: UpdateGateKeeperController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyBackButton(
                          text: 'Update Gatekeeper Details',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Stack(
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.white,
                                backgroundImage: controller.imageFile == null
                                    ? NetworkImage(Api.imageBaseUrl +
                                        controller.gatekeeper.image
                                            .toString()) as ImageProvider
                                    : FileImage(
                                        File(controller.imageFile!.path),
                                      ),
                              ),
                            ),
                            Positioned(
                              left: 70,
                              top: 70,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: this.context,
                                      builder: (context) {
                                        return Container(
                                          height: 100.0,
                                          width: MediaQuery.of(this.context)
                                              .size
                                              .width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Choose Profile Photo',
                                                style: TextStyle(fontSize: 20),
                                              ),
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
                                                    icon: Icon(Icons.camera),
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
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                          controller: controller.mobilenoController,
                          validator: emptyStringValidator,
                          hintText: 'Mobile nO',
                          labelText: 'Enter Mobile No',
                        ),
                        MyTextFormField(
                          controller: controller.addressController,
                          validator: emptyStringValidator,
                          hintText: 'Address ',
                          labelText: 'Enter Address',
                        ),
                        MyTextFormField(
                          textInputType: TextInputType.number,
                          controller: controller.gatenoController,
                          validator: emptyStringValidator,
                          hintText: 'Gate No ',
                          labelText: 'Enter Gate No',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        MyButton(
                          onPressed: controller.isLoading
                              ? null
                              : () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      // if (controller.imageFile == null) {
                                      //   Get.snackbar(
                                      //       'error', 'Please Select An Image');
                                      // } else {

                                      controller.updateGatekeeperApi(
                                          gatekeeperid:
                                              controller.gatekeeper.id!,
                                          gatekeeperfirstname:
                                              controller.fnameController.text,
                                          gatekeeperlastname:
                                              controller.lnameController.text,
                                          gatekeepergateno:
                                              controller.gatenoController.text,
                                          gatekeepermobileno: controller
                                              .mobilenoController.text,
                                          gatekeeperaddress:
                                              controller.addressController.text,
                                          image: controller.imageFile,
                                          bearerToken:
                                              controller.user.bearerToken!);
                                    }
                                  }
                                },
                          color: primaryColor,
                          name: 'Save',
                          outlinedBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
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
                                        content: Column(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/reset_password_icon.svg',
                                              width: 200,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            MyPasswordTextFormField(
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
                                                resetPasswordController
                                                    .resetPasswordApi(
                                                        gateKeeperId: controller
                                                            .gatekeeper.id!,
                                                        bearerToken: controller
                                                            .user.bearerToken!,
                                                        password:
                                                            resetPasswordController
                                                                .passwordController
                                                                .text);
                                                Get.back();
                                              },
                                              textStyle: btntextStyle(
                                                  20,
                                                  Colors.white,
                                                  FontWeight.w500,
                                                  FontStyle.normal),
                                            )
                                          ],
                                        ));
                                  },
                                  child: Wrap(
                                    children: [MyText(name: 'Reset Password')],
                                  ));
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
