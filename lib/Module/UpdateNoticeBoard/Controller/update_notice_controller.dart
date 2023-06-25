import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../../NoticeBoard/Model/notice_board_model.dart';

class UpdateNoticeBoardController extends GetxController {
  final formKey = new GlobalKey<FormState>();

  TextEditingController noticetitleController = TextEditingController();

  TextEditingController noticedescriptionController = TextEditingController();

  TextEditingController startnoticedateController = TextEditingController();
  TextEditingController endnoticedateController = TextEditingController();

  TextEditingController startnoticetimeController = TextEditingController();
  TextEditingController endnoticetimeController = TextEditingController();
  var arguments = Get.arguments;
  bool isLoading=false;
  late NoticeBoardModel  notice;
  // var token;
  User? userdata;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   notice = arguments[0];
    userdata = arguments[1];




    noticetitleController.text = notice!.noticetitle!;
    noticedescriptionController.text = notice!.noticedetail!;
    startnoticedateController.text = notice!.startdate!;
    endnoticedateController.text = notice!.enddate!;
    startnoticetimeController.text = notice!.starttime!;
    endnoticetimeController.text = notice!.endtime!;
  }

  Future NoticeStartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    startnoticedateController.text = picked.toString().split(' ')[0];

    update();
  }

  Future NoticeEndDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    endnoticedateController.text = picked.toString().split(' ')[0];

    update();
  }

  Future NoticeStartTime(context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    print('timeee.$picked');
    var currentTime =
        '${picked!.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';

    currentTime.toString();
    startnoticetimeController.text =
        currentTime.toString().split(' ')[0].trim();

    update();
  }

  Future NoticeEndTime(context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    print('timeee.$picked');
    var currentTime =
        '${picked!.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';

    currentTime.toString();

    endnoticetimeController.text = currentTime.toString().split(' ')[0].trim();

    update();
  }

  Future updateNoticeBoardApi({
    required int noticeid,
    required String noticetitle,
    required String noticedetail,
    required String startdate,
    required String enddate,
    required String starttime,
    required String endtime,
    required int subadminid,
    required String bearerToken,
  }) async {
    print("update api");
    print(noticeid.toString());

    print(noticetitle);
    print(noticedetail);
    print(bearerToken.toString());

    final response = await Http.post(
      Uri.parse(Api.updateNotice),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
      body: jsonEncode(<String, dynamic>{
        "id": noticeid,
        "noticetitle": noticetitle,
        "noticedetail": noticedetail,
        "startdate": startdate,
        "enddate": enddate,
        "starttime": starttime,
        "endtime": endtime,
        "status": 1,

      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("data 200 $data");
      print(response.statusCode);

      Get.offAndToNamed(noticeboardscreen, arguments: userdata);

      Get.snackbar("notice Updated Successfully", "");
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
      Get.snackbar("Failed to Updated Notice", "");
    }
  }
}
