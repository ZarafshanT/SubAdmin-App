import 'dart:convert';

//import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';

import '../../../../Model/User.dart';

import '../Model/myapimodel.dart';


class HomeScreenController extends GetxController {
  late final User user;
  var userdata = Get.arguments;
    var scaffoldKey = GlobalKey<ScaffoldState>();


  PhasesList? selectedItem;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //NotificationServices notificationServices = NotificationServices();
    // notificationServices.requestNotification();
    // notificationServices.fireBaseInit();
    // notificationServices.setupInteractMessage();
    // notificationServices.getDeviceToken();

    user = userdata;

    print("bidddd ${user.societyid}");
  }

  // setAlarm({required alarmSettings}) async {
  //   await Alarm.set(alarmSettings: alarmSettings);
  // }

  viewUnVerifiedResidentCountApi(
      {required int subadminid,
      required String token,
      required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedResidentCount.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    print(data['data']);

    if (response.statusCode == 200) {
      return data['data'];
    }

    return data['data'];
  }
}
