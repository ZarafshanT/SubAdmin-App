import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Model/User.dart';

class PhaseBuildingOrBlockController extends GetxController {
  var data = Get.arguments;

  late final User user;
  int? pid;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    user = data[0];
    pid = data[1];
    
  }
}
