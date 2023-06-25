import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/Finance%20Manger/View%20Finance%20Manager/Controller/view_finance_manager_controller.dart';
import 'package:societyadminapp/Module/Finance%20Manger/View%20Finance%20Manager/Model/FinanceManagerModel.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';

import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Dialog Box/my_dialog_box.dart';

class ViewFinanceManager extends GetView {
  @override
  Widget build(BuildContext context) {
    print('build');
    return GetBuilder<ViewFinanceManagerController>(
      init: ViewFinanceManagerController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          await Get.offNamed(homescreen, arguments: controller.userdata);

          return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor('#F5F5F5'),
            body: Column(
              children: [
                MyBackButton(
                  text: "Finance Managers",
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.userdata);
                  },
                ),
                32.h.ph,
                Expanded(
                  child: FutureBuilder<FinanceManagerModel>(
                      future: controller.financeManagerViewApi(
                          subAdminId: controller.user.userid!,
                          bearerToken: controller.user.bearerToken,
                          context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<FinanceManagerModel> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            padding: EdgeInsets.all(8),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 327.w,
                                height: 88.96,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        17.0.r), // set the desired radius
                                  ),
                                  child: ListTile(
                                    title: Text(snapshot
                                        .data!.data![index].firstname
                                        .toString()),
                                    subtitle: Text(snapshot
                                        .data!.data![index].address
                                        .toString()),
                                    titleTextStyle: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: HexColor('#404345')),
                                    subtitleTextStyle: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: HexColor('#AAAAAA')),
                                    leading: Container(
                                      width: 70.4.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            Api.imageBaseUrl +
                                                snapshot
                                                    .data!.data![index].image
                                                    .toString(),
                                          ))),
                                    ),
                                    trailing: Padding(
                                      padding: EdgeInsets.only(top: 30.h),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return CustomDialog(
                                                      image: SvgPicture.asset(
                                                          "assets/showdialog_delete_icon.svg",
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.06),
                                                      negativeBtnPressed: () {
                                                        Get.back();
                                                      },
                                                      title: "Are you sure !",
                                                      content:
                                                          "Do you want to delete this?",
                                                      positiveBtnText: "Delete",
                                                      negativeBtnText: "Cancel",
                                                      positiveBtnPressed:
                                                          () async {
                                                        controller.financeManagerDeleteApi(
                                                            financeManagerId:
                                                                snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .financemanagerid,
                                                            bearerToken:
                                                                controller.user
                                                                    .bearerToken,
                                                            context: context);
                                                        Get.back();
                                                      },
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              child: SvgPicture.asset(
                                                'assets/delete_icon.svg',
                                                height: 13,
                                                fit: BoxFit.scaleDown,
                                              ),
                                              width: 22.w,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r)),
                                            ),
                                          ),
                                          6.w.pw,
                                          GestureDetector(
                                            onTap: () {
                                              print(snapshot.data!.data![index]
                                                  .runtimeType);

                                              Get.offNamed(updateFinanceManager,
                                                  arguments: [
                                                    controller.user,
                                                    snapshot.data!.data![index]
                                                  ]);
                                              //
                                            },
                                            child: Container(
                                              child: SvgPicture.asset(
                                                  'assets/edit_icon.svg',
                                                  fit: BoxFit.scaleDown,
                                                  height: 13),
                                              width: 22.w,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {},
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
                      }),
                )
              ],
            ),
            floatingActionButton: IconButton(
                padding: EdgeInsets.only(top: 85),
                iconSize: MediaQuery.of(context).size.height * 0.065,
                icon: SvgPicture.asset('assets/floatingbutton.svg'),
                onPressed: () {
                  Get.offAndToNamed(addFinanceManager,
                      arguments: controller.user);
                }),
          ),
        ),
      ),
    );
    ;
  }
}
