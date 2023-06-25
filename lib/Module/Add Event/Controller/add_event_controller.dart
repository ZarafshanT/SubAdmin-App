
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Model/User.dart';

import '../../../Routes/set_routes.dart';

class AddEventScreenController extends GetxController {

  var user = Get.arguments;
  late final User userdata;
  bool isLoading=false;

  @override
  void onInit() {
    super.onInit();
    userdata= this. user;
  }
  final formKey = new GlobalKey<FormState>();
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventStartDateController = TextEditingController();
  TextEditingController eventEndDateController = TextEditingController();
  int eventActive=0;


  Future StartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null)
      picked.toString();

    print(picked);
    eventStartDateController.text =await picked.toString().split(' ')[0];
    print(eventStartDateController.text);
    update();


  }

  Future EndDate(context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null)
      picked.toString();

    eventEndDateController.text = picked.toString().split(' ')[0];


    update();
  }

  Future addEventApi(
      {required int userid,
        required String token,
      required  String eventTitle,
      required  String eventDescription,
      required  String eventStartDate,
      required  String eventEndDate,
      }) async
  {

    print(userid);
    print(token);

isLoading=true;
update();

    final response = await Http.post(
      Uri.parse(Api.addEvent),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{

        "userid": userid,
        "title": eventTitle,
        "description": eventDescription,
        "startdate": eventStartDate,
        "enddate": eventEndDate,
        "active": "0",
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      // isLoading=false;
      update();
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offNamed(eventsscreen,arguments: user);


      Get.snackbar("Event Add Successfully", "");
    }

    else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      (data['errors'] as List)
          .map((e) => Get.snackbar(
        "Error",
        e.toString(),
      ))
          .toList();
    }

    else {
      Get.snackbar("Failed to Add Event", "");
    }
  }




}
