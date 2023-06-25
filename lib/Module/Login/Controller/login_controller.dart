import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Repo/Login Repository/login_repository.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Model/SocietyModel.dart';
import '../../../../Model/User.dart';

class LoginController extends GetxController {
  var isHidden = false;
  TextEditingController userCnicController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final _repository = LoginRepository();
  bool loading = false;

  Future loginApi(String cnic, String password) async {
    print("Login Api  Functions Hits ! ");

    print("=========");
    print(cnic);
    print(password);
    print("=========");
    try {
      final response = await Http.post(
        Uri.parse(Api.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'cnic': cnic,
          'password': password,
        }),
      );
      print("Login Api Hits Successfully !");
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['data']['roleid'] == 2) {
        final SocietyModel societyModel =
            await viewSocietyApi(data['data']['societyid'], data['Bearer']);

        final User user = User(
            structureType: societyModel.structuretype,
            societyorbuildingname: societyModel.name,
            userid: data['data']['subadminid'],
            firstName: data['data']['firstname'],
            lastName: data['data']['lastname'],
            address: data['data']['address'],
            mobileno: data['data']['mobileno'],
            cnic: data['data']['cnic'],
            roleId: data['data']['roleid'],
            roleName: data['data']['rolename'],
            image: data['data']['image'],
            created_at: data['data']['created_at'],
            updated_at: data['data']['updated_at'],
            fcmtoken: data['data']['fcmtoken'],
            societyid: data['data']['societyid'],
            subadminid: data['data']['subadminid'],
            superadminid: data['data']['superadminid'],
            bearerToken: data['Bearer']);

        MySharedPreferences.setUserData(user: user);

        FirebaseMessaging.instance.getToken().then((value) {
          String? token = value;
          print('Fire Base token');
          print('--------');
          print(token);
          fcmtokenrefresh(user.userid!, token!, user.bearerToken!);
        });

        Get.offAndToNamed(homescreen, arguments: user);
        Get.snackbar(
          "Login Successfully",
          "Welcome 😉 " +
              user.firstName.toString() +
              " " +
              user.lastName.toString(),
          backgroundColor: Colors.white,
        );
      } else if (response.statusCode == 200 && data['data']['roleid'] != 2) {
        Get.snackbar(
          "Login Failed",
          'You are not Register to our System. Contact Admin !',
          backgroundColor: Colors.white,
        );
      } else if (response.statusCode == 401) {
        var data = jsonDecode(response.body.toString());

        print(data['data']);
        Get.snackbar('Unauthorized', 'Invalid Cnic or Password');
      } else if (response.statusCode == 403) {
        var data = jsonDecode(response.body.toString());

        if ((data['errors'] as List).contains('The cnic field is required.')) {
          Get.snackbar('Error Message', 'Cnic Required');
        } else if ((data['errors'] as List)
            .contains('The password field is required.')) {
          Get.snackbar('Error Message', 'Password Required');
        }
      }
    } on SocketException {
      Get.snackbar('Error Message', 'No Internet');
    } on Error catch (e) {
      Get.snackbar('Error Message', e.toString());
    }
  }

  Future fcmtokenrefresh(int id, String fcmtoken, String bearertoken) async {
    print("Fcm token refresh Api   Hits ! ");

    try {
      final response = await Http.post(
        Uri.parse(Api.fcmTokenRefresh),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $bearertoken"
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'fcmtoken': fcmtoken,
        }),
      );
      print("Fcm token refresh Api Hits Successfully !");
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);

      print(data);
    } catch (SocketException) {
      Get.snackbar('Error Message', 'No Internet Connection');
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  viewSocietyApi(int societyid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.viewSocietyApi + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      for (var e in mydata) {
        return SocietyModel(
            id: e['id'],
            name: e['name'],
            address: e['address'],
            country: e['country'],
            state: e['state'],
            city: e['city'],
            type: e['type'],
            area: e['area'],
            structuretype: e['structuretype'],
            superadminid: e['superadminid']);
      }
    } else {}
  }
}
