import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Model/Blocks.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../../Model/User.dart';

import '../Model/LocalBuildingApartment.dart';


class LocalBuildingApartmentController extends GetxController {
  var data = Get.arguments;
  int? fid;
  

  late final User user;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    user = data[0];
    fid = data[1];
    
  }

  Future<LocalBuildingApartment> LocalBuildingApartmentsApi(
      {required int fid, required String bearerToken}) async {
    print("${fid.toString()}");
    print(bearerToken);

    final response = await Http.get(
      Uri.parse(Api.viewLocalBuildingApartments + "/" + fid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      return LocalBuildingApartment.fromJson(data);
    }

    return LocalBuildingApartment.fromJson(data);
  }
}
