import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/AddResident/Controller/add_resident_controller.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Model/User.dart';
import '../../../Widgets/ReusableTextWidget/textstyle.dart';

class AddResident extends StatefulWidget {
  @override
  State<AddResident> createState() => _AddResidentState();
}

class _AddResidentState extends State<AddResident> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AddResidentController>(
          init: AddResidentController(),
          builder: (controller) {
            print('build');
            return Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyBackButton(
                      text: 'Add Resident',
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
                                ? AssetImage('assets/mia.png') as ImageProvider
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
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
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
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "Select Residential Type",
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  // color: secondaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                              value: controller.rentalorownerval,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: primaryColor,
                              ),
                              items: controller.rentalorownerlist
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.RentalOrOwner(newValue);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "Select Property Type",
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,

                                  // color: secondaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                              value: controller.houseorapartment,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: primaryColor,
                              ),
                              items: controller.houseorapartmentlist
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.HouseApartment(newValue);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyTextFormField(
                      controller: controller.firstnameController,
                      maxLines: 1,
                      validator: emptyStringValidator,
                      hintText: 'First Name',
                      labelText: 'Enter First Name',
                    ),
                    MyTextFormField(
                      controller: controller.lastnameController,
                      validator: emptyStringValidator,
                      hintText: 'Last Name',
                      labelText: 'Enter Last Name',
                    ),
                    MyTextFormField(
                      controller: controller.cnicController,
                      validator: emptyStringValidator,
                      hintText: 'Cnic',
                      labelText: 'Enter Cnic',
                    ),
                    MyTextFormField(
                      controller: controller.vehiclenoController,
                      validator: emptyStringValidator,
                      hintText: 'Vechile No',
                      labelText: 'Enter Vechile No',
                    ),
                    MyTextFormField(
                      controller: controller.addressController,
                      validator: emptyStringValidator,
                      hintText: 'Address',
                      labelText: 'Enter Address',
                    ),
                    MyTextFormField(
                      controller: controller.mobileNoController,
                      validator: emptyStringValidator,
                      hintText: 'Mobile No',
                      labelText: 'Enter Mobile No',
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
                    controller.rentalorownerval == 'Rental'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Enter Owner Details',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              MyTextFormField(
                                controller: controller.ownernameController,
                                validator: emptyStringValidator,
                                hintText: 'Owner Name',
                                labelText: 'Enter Owner Name',
                              ),
                              MyTextFormField(
                                controller: controller.owneraddressController,
                                validator: emptyStringValidator,
                                hintText: ' Owner Address',
                                labelText: 'Enter Owner Address',
                              ),
                              MyTextFormField(
                                controller: controller.ownerphonenumController,
                                validator: emptyStringValidator,
                                hintText: 'Owner Phone No',
                                labelText: 'Enter Phone No',
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    MyButton(
                      onPressed: controller.isLoading
                          ? null
                          : () {
                              if (controller.formKey.currentState!.validate()) {
                                if (controller.imageFile?.path == null) {
                                  Get.snackbar('Warning', 'Select an image !');
                                } else {
                                  User user = controller.user;

                                  controller.addResidentApi(
                                      ownerName:
                                          controller.ownernameController.text,
                                      ownerAddress: controller
                                          .owneraddressController.text,
                                      ownerPhoneNo: controller
                                          .ownerphonenumController.text,
                                      file: controller.imageFile,
                                      residentalType:
                                          controller.rentalorownerval,
                                      propertyType: controller.houseorapartment,
                                      firstName:
                                          controller.firstnameController.text,
                                      lastName:
                                          controller.lastnameController.text,
                                      cnic: controller.cnicController.text,
                                      vechileno:
                                          controller.vehiclenoController.text,
                                      address:
                                          controller.addressController.text,
                                      mobileno:
                                          controller.mobileNoController.text,
                                      password:
                                          controller.passwordController.text,
                                      bearerToken: user.bearerToken!,
                                      subadminid: user.userid!);
                                }
                                // Get.offAndToNamed(viewuser);
                              }
                            },
                      textColor: Colors.white,
                      color: primaryColor,
                      name: 'Save',
                      outlinedBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      textStyle: btntextStyle(
                          20, Colors.white, FontWeight.w500, FontStyle.normal),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
