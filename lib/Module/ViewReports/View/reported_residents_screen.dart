import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/ReportsScreenCard/reports_screen_card.dart';
import '../Controller/reported_resident_controller.dart';
import '../Model/ReportedResident.dart';

class ReportedResidentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentsListController>(
      init: ResidentsListController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(homescreen, arguments: controller.user);

          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              MyBackButton(
                text: 'Reported Residents',
                onTap: () {
                  Get.offNamed(homescreen, arguments: controller.user);
                },
              ),
              Expanded(
                child: FutureBuilder<List<ReportedResident>>(
                    future: controller.viewResidentsApi(
                        controller.userdata.userid!,
                        controller.userdata.bearerToken!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null &&
                            snapshot.data!.length != 0) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return ReportsScreenCard(
                                img: Api.imageBaseUrl +
                                    snapshot.data![index].image.toString(),
                                heading: snapshot.data![index].firstname
                                        .toString() +
                                    ' ' +
                                    snapshot.data![index].lastname.toString(),
                                heading1:
                                    snapshot.data![index].title.toString(),
                                heading2: snapshot.data![index].mobileno,
                                showIcon: false,
                                buttonName: 'Reports',
                                color: primaryColor,
                                onPressed: () {
                                  Get.offNamed(userreportslistscreen,
                                      arguments: [
                                        controller.user,
                                        snapshot.data![index].userid,
                                        snapshot.data![index].firstname,
                                        snapshot.data![index].lastname,
                                        snapshot.data![index].address,
                                        snapshot.data![index].mobileno,
                                      ]);
                                },
                              );
                            },
                            itemCount: snapshot.data!.length,
                          );
                        } else {
                          return Center(
                              child: Text('No Reports',
                                  style: GoogleFonts.ubuntu(
                                      color: HexColor('#404345'),
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 0.0015,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)));
                          ;
                        }
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: primaryColor,
                        ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
