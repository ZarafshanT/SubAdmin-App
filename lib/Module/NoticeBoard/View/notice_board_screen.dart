import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/NoticeBoard/Controller/notice_board_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/Event&NoticeBoardViewCard/event_n_noticeboard_view_card.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
class NoticeBoardScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeBoardController>(
      init: NoticeBoardController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(homescreen, arguments: controller.user);
          return true;
        },
        child: Scaffold(
            floatingActionButton: IconButton(
                padding: EdgeInsets.only(top: 85.h),
                iconSize: MediaQuery.of(context).size.height * 0.065,
                icon: SvgPicture.asset('assets/floatingbutton.svg'),
                onPressed: () {
                  Get.offNamed(addnoticeboardscreen,
                      arguments: controller.user);
                }),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                MyBackButton(
                  text: 'NoticeBoard',
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.user);
                  },
                ),
                Expanded(
                  child: FutureBuilder(
                      future: controller.data,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null &&
                              snapshot.data!.length != 0) {
                            return ListView.builder(
                                itemBuilder: (context, index) {
                                  return EventnNoticeBoardViewCard(
                                      title: snapshot.data![index].noticetitle
                                          .toString(),
                                      description: snapshot
                                          .data![index].noticedetail
                                          .toString(),
                                      showButtons: false,
                                      showeventCardDesginImg: false,
                                      DeleteDialogPress: () {
                                        controller.currentNoticeBoardId =
                                            snapshot.data![index].id;

                                        controller.deleteNoticeBoardApi(
                                            controller.currentNoticeBoardId,
                                            controller.userdata.bearerToken!);
                                      },
                                      updateOnPressed: () {
                                        Get.toNamed(updatenoticeboardscreen,
                                            arguments: [
                                              snapshot.data![index],
                                              controller.user
                                            ]);
                                      },
                                      startdate: snapshot.data![index].startdate
                                          .toString(),
                                      enddate: snapshot.data![index].enddate
                                          .toString(),
                                      gradientColors: [
                                        HexColor("#F2F2F2"),
                                        HexColor("#F2F2F2")
                                      ],
                                      iconColor: HexColor('#FF9900'),
                                      startDatecolor: HexColor('#FF9900'),
                                      endDatecolor: HexColor('#FF9900'));
                                },
                                itemCount: snapshot.data!.length);
                          } else {
                            return Center(
                                child: Text(
                              'No Notices',
                              style: GoogleFonts.ubuntu(
                                  color: HexColor('#404345'),
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.0015,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ));
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
            )),
      ),
    );
  }
}
