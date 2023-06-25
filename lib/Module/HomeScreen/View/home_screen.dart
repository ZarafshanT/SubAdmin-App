import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:societyadminapp/Module/HomeScreen/Widgets/admin_screen_custom_button.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../../Constants/constants.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Widgets/UpIcon/up_icon.dart';

class HomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: true,
        
        key: controller.scaffoldKey,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Text(
                    controller.user.firstName! +
                        " " +
                        controller.user.lastName!,
                    style: GoogleFonts.inriaSerif(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: HexColor('#FF9900')),
                  ),
                  10.ph,
                  Container(
                    child:
                        Center(child: SvgPicture.asset('assets/splashsvg.svg')),
                  )
                ],
              )),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: primaryColor,
                ),
                title: Text("Logout"),
                onTap: () {
                  MySharedPreferences.deleteUserData();
                  Get.offAllNamed(login);
                },
              ),
            ],
          ),
        ),
        backgroundColor: HexColor('#F5F5F5'),
        body: Column(children: [
          // drawer title n bell
          Padding(
            padding: EdgeInsets.only(
              left: 38.w,
              top: 72.h,
            ),
            child: Row(
              children: [
                IconButton(
                    icon: SvgPicture.asset(
                      'assets/drawer.svg',
                    ),
                    onPressed: () {
                      controller.scaffoldKey.currentState!.openDrawer();
                    }),
                22.pw,
                Text(
                  'Society Admin',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.font,
                      color: primaryColor),
                ),
                93.95.pw,
                IconButton(
                    icon: SvgPicture.asset(
                      'assets/bell.svg',
                    ),
                    onPressed: () {
                      Get.offNamed(reportnotificationsscreen,
                          arguments: controller.user);
                    }),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 30.w,
              top: 32.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(viewuser, arguments: controller.user);
                      },
                      icon: 'assets/residents.svg',
                      text: 'Residents',
                    ),
                    11.pw,
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(gatekeeperscreen,
                            arguments: controller.user);
                      },
                      icon: 'assets/gatekeepers.svg',
                      text: 'Gatekeeper',
                    ),
                  ],
                ),
                16.ph,
                Row(
                  children: [
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(eventsscreen, arguments: controller.user);
                      },
                      icon: 'assets/events.svg',
                      text: 'Events',
                    ),
                    11.pw,
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(noticeboardscreen,
                            arguments: controller.user);
                      },
                      icon: 'assets/noticeboard.svg',
                      text: 'NoticeBoard',
                    ),
                  ],
                ),
                16.ph,
                Row(
                  children: [
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(viewreportscreen,
                            arguments: controller.user);
                      },
                      icon: 'assets/reports.svg',
                      text: 'Reports',
                    ),
                    11.pw,
                    (controller.user.structureType == 4)
                        ? AdminScreenContainer(
                            onTap: () async {
                              Get.offNamed(localbuildingscreen,
                                  arguments: controller.user);
                            },
                            icon: 'assets/reports.svg',
                            text: 'Building\nDetail',
                          )
                        : AdminScreenContainer(
                            onTap: () async {
                              if (controller.user.structureType == 1) {
                                Get.offNamed(streetorbuildingscreen,
                                    arguments: controller.user);
                              } else if (controller.user.structureType == 2) {
                                Get.offNamed(blockorsocietybuilding,
                                    arguments: controller.user);
                              } else if (controller.user.structureType == 3) {
                                Get.offNamed(phaseorsocietybuilding,
                                    arguments: controller.user);
                              } else if (controller.user.structureType == 5) {
                                Get.offNamed(
                                    structureType5HouseOrBuildingMiddlewareScreen,
                                    arguments: controller.user);
                              }
                            },
                            icon: 'assets/reports.svg',
                            text: 'Society\nDetail',
                          ),
                  ],
                ),
                16.ph,
                Row(
                  children: [
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(unverifiedresident,
                            arguments: controller.user);
                      },
                      icon: 'assets/reports.svg',
                      text: 'Resident\nVerification',
                    ),
                    11.pw,
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(measurementview,
                            arguments: controller.user);
                      },
                      icon: 'assets/reports.svg',
                      text: 'Measurement',
                    ),
                  ],
                ),
                16.ph,
                Row(
                  children: [
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(bills, arguments: controller.user);
                      },
                      icon: 'assets/reports.svg',
                      text: 'Bills',
                    ),
                    11.pw,
                    AdminScreenContainer(
                      onTap: () async {
                        Get.offNamed(residentialEmergencyScreen,
                            arguments: controller.user);
                      },
                      icon: 'assets/reports.svg',
                      text: 'Residential\nEmergency',
                    ),
                  ],
                ),
              ],
            ),
          ),

          50.ph,
          UpIcon(),
        ]),
      ),
    );
  }
}
