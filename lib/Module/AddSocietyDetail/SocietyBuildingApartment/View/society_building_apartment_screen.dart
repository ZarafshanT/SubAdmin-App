import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Controller/block_controller.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/society_building_apartment_controller.dart';

class SocietyBuildingApartmentScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyBuildingApartmentController>(
        init: SocietyBuildingApartmentController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(societybuildingfloorsscreen,
                  arguments: [controller.user, controller.bid]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.offAndToNamed(addsocietybuildingapartmentsscreen,
                            arguments: [
                              controller.user,
                              controller.fid,
                              controller.bid
                            ]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Apartments',
                        onTap: () {
                          Get.offAndToNamed(societybuildingfloorsscreen,
                              arguments: [controller.user, controller.bid]);
                        },
                      ),
                      Expanded(
                          child: FutureBuilder(
                              future: controller.SocietyBuildingApartmentsApi(
                                  fid: controller.fid!,
                                  bearerToken: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 80,
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 10, 0, 0),
                                            child: Text(
                                              snapshot.data.data[index].name
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  // color: secondaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: HexColor('#4D4D4D')),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              })),
                      //                 MyButton(
                      //                     name: 'Next',
                      //                     onPressed: controller.isLoading
                      //                         ? null
                      //                         : () {
                      //                             if (controller.formkey.currentState!.validate()) {
                      // print(controller.myApiData);
                      //                             } else {
                      //                               return null;
                      //                             }
                      //                           })
                    ],
                  )),
            ),
          );
        });
  }
}
