// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../Constants/api_routes.dart';
// import '../../../Constants/constants.dart';
// import '../../../Widgets/My Back Button/my_back_button.dart';
// import '../../../Widgets/My Button/my_button.dart';
// import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
// import '../../../Widgets/My TextForm Field/my_textform_field.dart';
// import '../Controller/updateuserdetail_user_screen.dart';
//
// class UpdateResidentDetails extends StatefulWidget {
//   @override
//   State<UpdateResidentDetails> createState() => _UpdateResidentDetailsState();
// }
//
// class _UpdateResidentDetailsState extends State<UpdateResidentDetails> {
//   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: GetBuilder<UpdateResidentDetailsController>(
//           init: UpdateResidentDetailsController(),
//           builder: (controller) {
//             return Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                   child: Center(
//                     child: Column(
//
//                         children: <Widget>[
//                           MyBackButton(text:'Update Resident Details' ,),
//                       SizedBox(height:30,),
//                       Stack(
//                         children: <Widget>[
//                           FittedBox(
//                             fit: BoxFit.contain,
//                             alignment: Alignment.center,
//                             child: CircleAvatar(
//                               radius: 50.0,
//                               backgroundColor: Colors.white,
//                               backgroundImage: controller.imageFile == null
//                                   ? NetworkImage(imageBaseUrl +
//                                           controller.resident.image.toString())
//                                       as ImageProvider
//                                   : FileImage(
//                                       File(controller.imageFile!.path),
//                                     ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 70,
//                             top: 70,
//                             child: InkWell(
//                               onTap: () {
//
//                                 showModalBottomSheet(
//                                     context: this.context,
//                                     builder: (context) {
//                                       return Container(
//                                         height: 100.0,
//                                         width: MediaQuery.of(this.context)
//                                             .size
//                                             .width,
//                                         margin: EdgeInsets.symmetric(
//                                             horizontal: 20, vertical: 20),
//                                         child: Column(
//                                           children: <Widget>[
//                                             Text(
//                                               'Choose Profile Photo',
//                                               style: TextStyle(fontSize: 20),
//                                             ),
//
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: <Widget>[
//                                                 ElevatedButton.icon(
//                                                   style:
//                                                       ElevatedButton.styleFrom(
//                                                           primary:
//                                                               primaryColor),
//                                                   icon: Icon(Icons.camera),
//                                                   onPressed: () {
//                                                     controller.getFromCamera(
//                                                         ImageSource.camera);
//                                                   },
//                                                   label: Text('Camera'),
//                                                 ),
//                                                 ElevatedButton.icon(
//                                                   style:
//                                                       ElevatedButton.styleFrom(
//                                                           primary:
//                                                               primaryColor),
//                                                   icon: Icon(Icons.image),
//                                                   onPressed: () {
//                                                     controller.getFromGallery(
//                                                         ImageSource.gallery);
//                                                   },
//                                                   label: Text('Gallery'),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     });
//                               },
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 color: primaryColor,
//                                 size: 28,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height:MediaQuery.of(context).size.height*0.05,),
//
//                       MyTextFormField(
//                           controller: controller.firstnameController,
//                           validator: emptyStringValidator,
//                           hintText: 'First Name',
//                           labelText: 'Enter First Name',
//                           onFocusedBorderColor: primaryColor,
//                           onEnabledBorderColor: primaryColor),
//                       MyTextFormField(
//                           controller: controller.lastnameController,
//                           validator: emptyStringValidator,
//                           hintText: 'Last Name',
//                           labelText: 'Enter Last Name',
//                           onFocusedBorderColor: primaryColor,
//                           onEnabledBorderColor: primaryColor),
//                       MyTextFormField(
//                           controller: controller.addressController,
//                           validator: emptyStringValidator,
//                           hintText: 'Address',
//                           labelText: 'Enter Address',
//                           onFocusedBorderColor: primaryColor,
//                           onEnabledBorderColor: primaryColor),
//                       MyTextFormField(
//                         controller: controller.mobileNoController,
//                         validator: emptyStringValidator,
//                         hintText: 'Mobile No',
//                         labelText: 'Enter Mobile No',
//                         onFocusedBorderColor: primaryColor,
//                         onEnabledBorderColor: primaryColor,
//                       ),
//                       MyTextFormField(
//                           controller: controller.vehiclenoController,
//                           validator: emptyStringValidator,
//                           hintText: 'Vechile No',
//                           labelText: 'Enter Vechile No',
//                           onFocusedBorderColor: primaryColor,
//                           onEnabledBorderColor: primaryColor),
//                       MyPasswordTextFormField(
//                         controller: controller.passwordController,
//                         onFocusedBorderColor: primaryColor,
//                         onEnabledBorderColor: primaryColor,
//                         obscureText: controller.isHidden,
//                         togglePasswordView: controller.togglePasswordView,
//                         labelTextColor: primaryColor,
//                         labelText: 'Password',
//                         hintText: 'Enter Password',
//                       ),
//                       controller.resident.residenttype == 'Rental'
//                           ? Column(crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: Text(
//                             'Update Owner Details',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//
//                         MyTextFormField(
//                                   controller: controller.ownernameController,
//                                   validator: emptyStringValidator,
//                                   hintText: 'Owner Name',
//                                   labelText: 'Enter Owner Name',
//                                   onFocusedBorderColor: primaryColor,
//                                   onEnabledBorderColor: primaryColor),
//                               MyTextFormField(
//                                   controller: controller.owneraddressController,
//                                   validator: emptyStringValidator,
//                                   hintText: ' Owner Address',
//                                   labelText: 'Enter Owner Address',
//                                   onFocusedBorderColor: primaryColor,
//                                   onEnabledBorderColor: primaryColor),
//                               MyTextFormField(
//                                   controller: controller.ownerphonenumController,
//                                   validator: emptyStringValidator,
//                                   hintText: 'Owner Phone No',
//                                   labelText: 'Enter Phone No',
//                                   onFocusedBorderColor: primaryColor,
//                                   onEnabledBorderColor: primaryColor),
//                             ])
//                           : Container(),
//                       SizedBox(height:MediaQuery.of(context).size.height*0.05,),
//
//                       MyButton(
//                         name: 'Update',
//                         color: primaryColor,
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // if (controller.imageFile?.path == null) {
//                             //   Get.snackbar('Warning', 'Select an image !');
//                             // } else {
//                             controller.updateResidentApi(
//                               ownerName: controller.ownernameController.text,
//                               ownerAddress:
//                                   controller.owneraddressController.text,
//                               ownerPhoneNo:
//                                   controller.ownerphonenumController.text,
//                               file: controller.imageFile,
//                               residentalType: controller.resident.residenttype!,
//                               propertyType: controller.resident.propertytype!,
//                               firstName: controller.firstnameController.text,
//                               lastName: controller.lastnameController.text,
//                               // cnic: controller.cnicController.text,
//                               vechileno: controller.vehiclenoController.text,
//                               address: controller.addressController.text,
//                               mobileno: controller.mobileNoController.text,
//                               password: controller.passwordController.text,
//                               bearerToken: controller.user.bearerToken!,
//                             );
//                           }
//                           // Get.offAndToNamed(viewuser);
//                         },
//                       ),
//                           SizedBox(height:MediaQuery.of(context).size.height*0.05,),
//
//
//                     ]),
//                   ),
//                 ));
//           }),
//     );
//   }
// }
