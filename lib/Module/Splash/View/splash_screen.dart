import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/constants.dart';

import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Services/Shared%20Preferences/MySharedPreferences.dart';

import '../../../../Model/User.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    getUserSharedPreferencesData();
  }

  void getUserSharedPreferencesData() async {
    User user = await MySharedPreferences.getUserData();
    print(user.bearerToken);
    if (user.bearerToken == "") {
      Timer(Duration(seconds: 3), () => Get.offAndToNamed(login));
    } else {
      Timer(Duration(seconds: 3),
          () => Get.offAndToNamed(homescreen, arguments: user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 103, top: 110),
              child: Container(
                  height: 194,
                  width: 190,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/splashline.png'))),
                  child: Column(
                    children: [
                      Container(
                          height: 98,
                          width: 98,
                          child: SvgPicture.asset('assets/splashsvg.svg')),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                          height: 28,
                          width: 240,
                          child: SvgPicture.asset('assets/smartgate.svg')),
                      SizedBox(
                        height: 7.98,
                      ),
                      Container(
                          height: 3,
                          width: 240,
                          child: SvgPicture.asset('assets/splashdivider.svg')),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 18,
                        child: Text(
                          'SMART WAY OF LIVING',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: HexColor('#FF9900')),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.only(left: 56),
              child: Container(
                  height: 158,
                  width: 262,
                  child: SvgPicture.asset('assets/splashsvg2.svg')),
            ),
            SizedBox(
              height: 46,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/splashsvg3.svg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
