import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Model/User.dart';
class AddBlockBuildingController extends GetxController {
  var data = Get.arguments;
  late final User user;
  bool isLoading = false;
  int? bid;
  String? type;

  final societyBuildingNameController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    user = data[0];
    bid = data[1];
    if (user.structureType == 2) {
      type = 'block building';
    } else {
      type = 'phase building';
    }
  }

  addSocietyBuildingApi({
    required String bearerToken,
    required int subadminid,
    required int societyid,
    required int superadminid,
    required int dynamicid,
    required String BuildingName,
  }) async {
    print(bearerToken);

    print(BuildingName);

    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.addSocietyBuilding));
    request.headers.addAll(headers);
    request.fields['societybuildingname'] = BuildingName;
    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();
    request.fields['superadminid'] = superadminid.toString();
    request.fields['dynamicid'] = dynamicid.toString();
    request.fields['type'] = type!;
    

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Building Addedd Successfully", "");

      Get.offAndToNamed(blockbuilding, arguments: [user, bid]);
      
    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );
    } else {
      isLoading = false;
      update();

      Get.snackbar("Failed to Add Blocks", "");
    }
  }
}
