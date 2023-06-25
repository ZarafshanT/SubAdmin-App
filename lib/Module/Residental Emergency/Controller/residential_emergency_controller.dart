import 'dart:convert';

import 'package:get/get.dart';
import '../../../Constants/api_routes.dart';

import '../../../../Model/User.dart';

import 'package:http/http.dart' as Http;

import '../Model/Residentialemergency.dart';

class ResidentialEmergencyController extends GetxController {
  late final User userdata;

  var data = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data;
    
  }

  viewEmergencyApi(int subadminid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.viewEmergency + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.statusCode);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.body);
      return ResidentialEmergeny.fromJson(data);
    }
    return ResidentialEmergeny.fromJson(data);
  }
}
