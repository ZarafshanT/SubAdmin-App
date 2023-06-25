import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/Events/Controller/event_screen_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/Event&NoticeBoardViewCard/event_n_noticeboard_view_card.dart';
import '../../../Widgets/Loader/loader.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';


class EventsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventScreenController>(
        init: EventScreenController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: IconButton(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(85)),
                  iconSize: MediaQuery.of(context).size.height * 0.065,
                  icon: SvgPicture.asset('assets/floatingbutton.svg'),
                  onPressed: () {
                    Get.offNamed(addeventsscreen, arguments: controller.user);
                  }),
              body: Column(
                children: [
                  MyBackButton(
                    text: 'Events',
                    widget: Padding(
                      padding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(142)),
                      child: DropdownButton(
                        // enableFeedback: true,
                        isExpanded: false,
                        style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: ScreenUtil().setSp(14),
                            color: HexColor('#4D4D4D')),
                        value: controller.eventVal,
                        icon: Icon(
                          Icons.filter_list,
                          color: primaryColor,
                        ),
                        items: controller.eventDropDownList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.setEventVal(newValue);
                          controller.data = controller.searchEventsApi(
                              userid: controller.userdata.userid!,
                              token: controller.userdata.bearerToken!,
                              query: controller.eventVal);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: controller.data,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null &&
                                snapshot.data.data.length != 0) {
                              return controller.isSearch
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ))
                                  : ListView.builder(
                                      itemBuilder: (context, index) {
                                        return EventnNoticeBoardViewCard(
                                          eventCardDesginImg:
                                              "assets/event_card_design.svg",
                                          title: snapshot.data.data[index].title
                                              .toString(),
                                          description: snapshot
                                              .data.data[index].description,
                                          onPressedofAddImage: () {
                                            controller.selectImages();
                                          },
                                          onPressedofViewImage: () {},
                                          gradientColors: [
                                            HexColor('#FF9900'),
                                            HexColor('#FB7712'),
                                          ],
                                          DeleteDialogPress: () {
                                            controller.deleteEventApi(
                                                snapshot.data.data[index].id,
                                                controller
                                                    .userdata.bearerToken!);
                                          },
                                          updateOnPressed: () {
                                            Get.offAndToNamed(updateevent,
                                                arguments:
                                                    snapshot.data.data[index]);
                                          },
                                          startdate: snapshot
                                              .data.data[index].startdate
                                              .toString(),
                                          enddate: snapshot
                                              .data.data[index].enddate
                                              .toString(),
                                        );
                                      },
                                      itemCount: snapshot.data.data.length);
                            } else {
                              return EmptyList(name: 'No Events');
                            }
                          } else if (snapshot.hasError) {
                            return Icon(Icons.error_outline);
                          } else {
                            return Loader();
                          }
                        }),
                  ),
                ],
              ));
        });
  }
}
