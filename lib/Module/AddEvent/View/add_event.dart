import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Module/AddEvent/Controller/add_event_controller.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';

import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/ReusableTextWidget/textstyle.dart';

class AddEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AddEventScreenController>(
            init: AddEventScreenController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(
                        text: 'Add Event',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SvgPicture.asset(
                        "assets/event_vector.svg",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MyTextFormField(
                        controller: controller.eventTitleController,
                        validator: emptyStringValidator,
                        hintText: 'Enter Event Title',
                        labelText: 'Event Title',
                      ),
                      MyTextFormField(
                        controller: controller.eventDescriptionController,
                        validator: emptyStringValidator,
                        hintText: 'Enter Event Description',
                        labelText: 'Event Description',
                      ),
                      MyTextFormField(
                        onTap: () {
                          controller.StartDate(context);
                        },
                        suffixIcon: SvgPicture.asset(
                            "assets/add_event_icon.svg",
                            fit: BoxFit.scaleDown),
                        controller: controller.eventStartDateController,
                        validator: emptyStringValidator,
                        hintText: 'Enter Event Start Date',
                        labelText: 'Start Date',
                      ),
                      MyTextFormField(
                        onTap: () {
                          controller.EndDate(context);
                        },
                        suffixIcon: SvgPicture.asset(
                            "assets/add_event_icon.svg",
                            fit: BoxFit.scaleDown),
                        controller: controller.eventEndDateController,
                        validator: emptyStringValidator,
                        hintText: 'Enter Event End Date',
                        labelText: 'End Date',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MyButton(
                        width: MediaQuery.of(context).size.width * 0.4,
                        elevation: 5,
                        onPressed: controller.isLoading
                            ? null
                            : () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.addEventApi(
                                      userid: controller.userdata.userid!,
                                      token: controller.userdata.bearerToken!,
                                      eventTitle:
                                          controller.eventTitleController.text,
                                      eventDescription: controller
                                          .eventDescriptionController.text,
                                      eventStartDate: controller
                                          .eventStartDateController.text,
                                      eventEndDate: controller
                                          .eventEndDateController.text);
                                } else {
                                  return null;
                                }
                              },
                        textColor: Colors.white,
                        color: primaryColor,
                        name: 'Save Event',
                        maxLines: 1,
                        outlinedBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        textStyle: btntextStyle(20, Colors.white,
                            FontWeight.w500, FontStyle.normal),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
