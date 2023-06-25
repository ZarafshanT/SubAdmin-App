// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as Http;
// import '../../../Constants/api_routes.dart';
// import '../../../Routes/set_routes.dart';
// import '../../Login/Model/User.dart';
// import '../../View Residents/Model/Resident.dart';
//
// class UpdateResidentDetailsController extends GetxController {
//
//   TextEditingController firstnameController = TextEditingController();
//   TextEditingController lastnameController = TextEditingController();
//   TextEditingController cnicController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController vehiclenoController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController ownernameController = TextEditingController();
//   TextEditingController owneraddressController = TextEditingController();
//   TextEditingController ownerphonenumController = TextEditingController();
//   final Resident resident = Get.arguments[0];
//   final User user = Get.arguments[1];
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     print(resident.residentid);
//     print(resident.residenttype);
//     print(user.bearerToken);
//     print(user.userid);
//     print(resident.vechileno);
//     print(resident.owneraddress);
//     print(resident.image);
//     print(resident.password);
//
//     // assign resident values to textfields
//     firstnameController.text = resident.firstname!;
//     lastnameController.text = resident.lastname!;
//     // cnicController.text=resident.cnic!;
//     addressController.text = resident.address!;
//     mobileNoController.text = resident.mobileno!;
//     vehiclenoController.text = resident.vechileno!;
//     passwordController.text = resident.password!;
//
//     if (resident.residenttype == 'Rental') {
//       ownernameController.text = resident.ownername!;
//       owneraddressController.text = resident.owneraddress!;
//       ownerphonenumController.text = resident.ownermobileno!;
//     }
//   }
//
//   bool commitemembercheck = false;
//   var isHidden = false;
//   var isLoading = false;
//   var imageFile;
//   getFromGallery(ImageSource source) async {
//     XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//
//     if (pickedFile != null) {
//       print('file picked: $pickedFile');
//       // img = pickedFile as Image?;
//
//       print('Assigning Image file');
//       imageFile = File(pickedFile.path);
//       update();
//     }
//   }
//
//   getFromCamera(ImageSource source) async {
//     XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       print('file picked: $pickedFile');
//       // img = pickedFile as Image?;
//
//       print('Assigning Image file');
//       imageFile = File(pickedFile.path);
//       update();
//     }
//   }
//
//   CommiteMemberCheckMethod(value) {
//     commitemembercheck = value;
//     update();
//   }
//
//   void togglePasswordView() {
//     isHidden = !isHidden;
//     update();
//   }
//
//   Future updateResidentApi(
//       {required File? file,
//       required String residentalType,
//       required String propertyType,
//       required String firstName,
//       required String lastName,
//       // required String cnic,
//       required String vechileno,
//       required String address,
//       required String mobileno,
//       required String password,
//       required String bearerToken,
//       required String ownerName,
//       required String ownerAddress,
//       required String ownerPhoneNo}) async {
//     print('Add Resident Api  Function Call');
//     print("----Data----");
//     print(file?.path);
//     print(residentalType);
//     print(propertyType);
//     print(firstName);
//     print(lastName);
//     print(vechileno);
//     print(address);
//     print(mobileno);
//     print(password);
//     print(ownerName);
//     print(ownerAddress);
//     print(ownerPhoneNo);
//
//     print(bearerToken);
//     try{
//
//     Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
//     var request =
//         Http.MultipartRequest('POST', Uri.parse(Api.update_residents));
//     request.headers.addAll(headers);
//     if(file!=null)
//       {
//
//     request.files.add(await Http.MultipartFile.fromPath('image', file.path));}
//     request.fields['id'] = resident.residentid.toString();
//     request.fields['firstname'] = firstName;
//     request.fields['lastname'] = lastName;
//     request.fields['address'] = address;
//     request.fields['mobileno'] = mobileno;
//     request.fields['password'] = password;
//     request.fields['vechileno'] = vechileno;
//     request.fields['propertytype'] = propertyType;
//     request.fields['residenttype'] = residentalType;
//     request.fields['committeemember'] = "0";
//     request.fields['ownername'] = ownerName;
//     request.fields['owneraddress'] = ownerAddress;
//     request.fields['ownermobileno'] = ownerPhoneNo;
//     var responsed = await request.send();
//     var response = await Http.Response.fromStream(responsed);
//
//     print(response.statusCode);
//     print(response.body);
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       print(data);
//       print(response.body);
//       Get.offAndToNamed(viewuser,arguments: user);
//
//
//       Get.snackbar("Resident Details Update Successfully", "");
//     }
//     else if (response.statusCode == 403) {
//       var data = jsonDecode(response.body.toString());
//
//         Get.snackbar(
//         "Error", data.toString(),
//       );
//     }
//
//     else if (response.statusCode == 500) {
//       var data = jsonDecode(response.body.toString());
//
//       Get.snackbar(
//         " Server Error ",data.toString()
//       );
//
//     }
//
//     else if (response.statusCode == 404) {
//       var data = jsonDecode(response.body.toString());
//
//       Get.snackbar(
//         "Not Found", data.toString(),
//       );
//     }}
//     catch (exp)
//     {
//       Get.snackbar(
//         "Error", exp.toString(),
//       );
//     }
//     }
//
//
//
//
//
// }
