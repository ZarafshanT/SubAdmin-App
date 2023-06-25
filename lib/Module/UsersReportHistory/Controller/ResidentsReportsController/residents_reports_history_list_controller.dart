import 'dart:convert';

import 'package:get/get.dart';
import 'package:societyadminapp/Module/ViewReports/Model/ReportedResident.dart';
import 'package:societyadminapp/Module/ViewReports/Model/ResidentReports.dart';

import '../../../../Constants/api_routes.dart';

import '../../../Login/Model/User.dart';

import 'package:http/http.dart' as Http;

import '../../Model/UsersReportsHistory.dart';

class UsersReportsHistoryController extends GetxController {
  var user = Get.arguments;
  var residentName;
  var residentId;
  var residentAddress;
  var residentMobileno;

  late final User userdata;

  List<UsersReportsHistory> li = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userdata = this.user[0];
    residentId = user[1];
    residentName = user[2] + ' ' + user[3];
    residentAddress = user[4];
    residentMobileno = user[5];

    print("init ${residentId}");
  }

  Future<List<UsersReportsHistory>> viewResidentsReportsApi(
      int subadminid, int residentid, String token) async {
    print("subadminiid.toString() ${subadminid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.historyReports +
          "/" +
          subadminid.toString() +
          "/" +
          residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      li = (data['data'] as List)
          .map((e) => UsersReportsHistory(
              id: e['id'],
              subadminid: e['subadminid'],
              userid: e['userid'],
              title: e['title'],
              description: e['description'],
              date: e['date'],
              status: e['status'],
              statusdescription: e['statusdescription'],
              created_at: e['created_at'],
              updated_at: e['updated_at']))
          .toList();

      return li;
    }
    return li;
  }
}
