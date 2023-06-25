import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Module/AddEvent/Controller/update_event_controller.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';

import '../../../Widgets/ReusableTextWidget/textstyle.dart';

class UpdateEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UpdateEventScreenController>(
            init: UpdateEventScreenController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      MyBackButton(
                        text: 'Update Event',
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
                      // CheckboxListTile(
                      //   title:controller.isCheckBox?  Text("Event Active",style:
                      //   TextStyle(color: Colors.green),):Text('Event InActive',style: TextStyle(color:Colors.red ),),
                      //   value: controller.isCheckBox,
                      //   onChanged: (newValue) {
                      //
                      //       controller.isEventActiveOrNot(newValue);
                      //       print(controller.isCheckBox);
                      //       print(controller.eventActive);
                      //
                      //   },
                      //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                      // ),
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
                                  controller.updateEventApi(
                                      token: controller.user.bearerToken!,
                                      eventTitle:
                                          controller.eventTitleController.text,
                                      eventDescription: controller
                                          .eventDescriptionController.text,
                                      eventStartDate: controller
                                          .eventStartDateController.text,
                                      eventEndDate: controller
                                          .eventEndDateController.text,
                                      eventActive: controller.eventActive,
                                      id: controller.eventdata.id);
                                } else {
                                  return null;
                                }
                              },
                        textColor: Colors.white,
                        color: primaryColor,
                        name: 'Update Event ',
                        maxLines: 1,
                        outlinedBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
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
