import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Module/Payments/Controller/add_payment_controller.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';

import '../../Widgets/ReusableTextWidget/textstyle.dart';

class Payments extends GetView {
  // final paymentcontroller = Get.put(AddPaymentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<AddPaymentController>(
                init: AddPaymentController(),
                builder: (paymentcontroller) {
                  return SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        MyBackButton(
                          text: 'Payments',
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Center(
                          child: SizedBox(
                            width: Get.width * .4,
                            height: Get.height * .2,
                            child: Image.asset(
                                'assets/payments_illustrations.png'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IntrinsicWidth(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            // runAlignment: WrapAlignment.start,
                            children: [
                              Text(
                                "Select Type",
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    // color: secondaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: HexColor('#4D4D4D')),
                              ),
                              SizedBox(
                                width: Get.width * .05,
                              ),
                              SizedBox(
                                width: Get.width * .47,
                                child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: 'Development Charges',
                                    items: <String>[
                                      'Development Charges',
                                      'Utility Charges',
                                      'Hidden Charges'
                                    ]
                                        .map<DropdownMenuItem<String>>(
                                            (String e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e.toString(),
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      // color: secondaryColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color:
                                                          HexColor('#4D4D4D')),
                                                )))
                                        .toList(),
                                    onChanged: (val) {}),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        // MyTextFormField(hintText: 'Enter Service Type', labelText: 'Service Type', onFocusedBorderColor: primaryColor, onEnabledBorderColor: primaryColor),
                        MyTextFormField(
                          hintText: 'Enter Charges',
                          labelText: 'Charges',
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: MyButton(
                            name: 'Generate Bill',
                            color: primaryColor,
                            onPressed: () {},
                            textStyle: btntextStyle(20, Colors.white,
                                FontWeight.w500, FontStyle.normal),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'Generate Textfields',
                                  content: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      MyTextFormField(
                                        controller: paymentcontroller.label,
                                        hintText: 'Enter Label',
                                        labelText: 'Label',
                                        textInputType: TextInputType.number,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: MyButton(
                                          name: 'Generate',
                                          color: primaryColor,
                                          onPressed: () {
                                            paymentcontroller
                                                .setDynamicTextFields(
                                                    controller:
                                                        paymentcontroller
                                                            .controller,
                                                    labelText: paymentcontroller
                                                        .label.text);

                                            Navigator.pop(context);
                                          },
                                          textStyle: btntextStyle(
                                              20,
                                              Colors.white,
                                              FontWeight.w500,
                                              FontStyle.normal),
                                        ),
                                      ),
                                    ],
                                  ));

                              // print( paymentcontroller.controllers.length);
                            },
                            child: Icon(Icons.add)),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: paymentcontroller.mytextformfields.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                paymentcontroller.mytextformfields[index],
                              ],
                            );
                          },
                        )
                      ]));
                })));
  }
}
