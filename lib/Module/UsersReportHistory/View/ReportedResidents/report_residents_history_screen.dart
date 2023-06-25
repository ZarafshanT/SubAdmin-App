import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:societyadminapp/Constants/constants.dart';

import 'package:societyadminapp/Module/ViewReports/Model/ReportedResident.dart';

import 'package:societyadminapp/Routes/set_routes.dart';

import '../../Controller/ReportedResidentsController/report_residents_history_controller.dart';

class UsersReportsScreen extends StatelessWidget {
  final ReportedResidentsController usersReportListController =
      Get.put(ReportedResidentsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportedResidentsController>(
      init: ReportedResidentsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('History Reported Residents'),
          backgroundColor: primaryColor,
        ),
        body: FutureBuilder<List<ReportedResident>>(
            future: controller.historyreportedresidents(
                controller.userdata.userid!, controller.userdata.bearerToken!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null && snapshot.data!.length != 0) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(usersreportshistorylistscreen, arguments: [
                                controller.user,
                                snapshot.data![index].userid,
                                snapshot.data![index].firstname,
                                snapshot.data![index].lastname,
                                snapshot.data![index].address,
                                snapshot.data![index].mobileno,
                              ]);
                            },
                            child: Container(
                              height: 130,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: ListTile(
                                  
                                  leading: CircleAvatar(
                                    radius: 30,
                                    //backgroundImage: NetworkImage(ima+snapshot.data![index].image.toString()),
                                  ),
                                  title: Text(snapshot.data![index].firstname
                                          .toString() +
                                      " " +
                                      snapshot.data![index].lastname
                                          .toString()),
                                  subtitle: Text(
                                      snapshot.data![index].address.toString()),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    ),
                  );
                } else {
                  return Text('no resident');
                }
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
