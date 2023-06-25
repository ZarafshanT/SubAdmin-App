import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Text/my_text.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../Controller/apartment_resident_verification_controller.dart';
import '../Model/Resident Model/ApartmentResidentModel.dart';

class ApartmentResidentVerification extends GetView {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<ApartmentResidentVerificationController>(
          init: ApartmentResidentVerificationController(),
          builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyBackButton(
                    text: 'Apartment Resident Verification',
                    onTap: () {
                      Get.offNamed(unverifiedresident,
                          arguments: controller.userdata);
                    },
                  ),
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                Api.imageBaseUrl +
                                                    controller.resident.image
                                                        .toString()))),
                                  ),
                                ),
                                MyText(name: 'Name'),
                                MyText(
                                  name: controller.resident.firstname
                                          .toString() +
                                      "" +
                                      controller.resident.lastname.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Cnic'),
                                MyText(
                                  name: controller.resident.cnic.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Mobile no'),
                                MyText(
                                  name: controller.resident.mobileno.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Country'),
                                MyText(
                                  name: controller.country.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'State'),
                                MyText(
                                  name: controller.resident.state.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'City'),
                                MyText(
                                  name: controller.resident.city.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Residental Type'),
                                MyText(
                                  name: controller.resident.residenttype
                                      .toString(),
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    "Select Building",
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        // color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: HexColor('#4D4D4D')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownSearch<Building>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllBuildingApi(
                                        bearerToken:
                                            controller.userdata!.bearerToken!,
                                        subAdminId: controller.userdata!.userid,
                                      );
                                    },
                                    onChanged: (Building? data) {
                                      controller.SelectedBuilding(data);
                                    },
                                    selectedItem: controller.building,
                                    itemAsString: (Building p) {
                                      return p.societybuildingname.toString();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    "Select Floor",
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        // color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: HexColor('#4D4D4D')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownSearch<Floor>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllFloorApi(
                                          bearerToken:
                                              controller.userdata!.bearerToken!,
                                          buildingid: controller.building?.id);
                                    },
                                    onChanged: (Floor? data) {
                                      controller.SelectedFloor(data);
                                    },
                                    selectedItem: controller.floor,
                                    itemAsString: (Floor p) {
                                      return p.name.toString();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    "Select Apartment",
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        // color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: HexColor('#4D4D4D')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownSearch<Apartment>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllApartmentApi(
                                          bearerToken:
                                              controller.userdata!.bearerToken!,
                                          floorid: controller.floor?.id);
                                    },
                                    onChanged: (Apartment? apartment) {
                                      controller.SelectedApartment(apartment);
                                      controller.houseaddressdetailController
                                              .text =
                                          "${controller.resident.society!.first.name}${','}${controller.building!.societybuildingname.toString()}${','} ${controller.floor!.name.toString()}${','}${apartment!.name.toString()}";
                                    },
                                    selectedItem: controller.apartment,
                                    itemAsString: (Apartment p) {
                                      return p.name.toString();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    "Select Area Type",
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        // color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: HexColor('#4D4D4D')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownSearch<Measurement>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller
                                          .housesApartmentsModelApi(
                                              subadminid:
                                                  controller.userdata!.userid!,
                                              token: controller
                                                  .userdata!.bearerToken!,
                                              type: 'apartment');
                                    },
                                    onChanged: (Measurement? data) {
                                      controller.SelectedHousesApartments(data);
                                    },
                                    selectedItem: controller.measurementModel,
                                    itemAsString: (Measurement p) {
                                      return p.area.toString() +
                                          ' ' +
                                          p.unit.toString();
                                    },
                                  ),
                                ),
                                MyTextFormField(
                                  validator: emptyStringValidator,
                                  maxLines: null,
                                  controller:
                                      controller.houseaddressdetailController,
                                  hintText: 'House / Apartment Adreess ',
                                  labelText: 'House / Apartment Adreess ',
                                ),
                                MyTextFormField(
                                  controller: controller.vehiclenoController,
                                  hintText: 'Vehicle No',
                                  labelText: 'Vehicle No (optional)',
                                ),
                                Center(
                                  child: MyButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.verifyApartmentResidentApi(
                                            residentid:
                                                controller.resident.residentid,
                                            status: 1,
                                            token: controller
                                                .userdata.bearerToken!,
                                            measurementid:
                                                controller.measurementModel!.id,
                                            buildingid:
                                                controller.building!.id!,
                                            societybuildingfloorid:
                                                controller.floor!.id!,
                                            societybuildingapartmentid:
                                                controller.apartment!.id!,
                                            vechileno: controller
                                                .vehiclenoController.text,
                                            houseaddress: controller
                                                .houseaddressdetailController
                                                .text);
                                      }
                                    },
                                    name: 'Verify',
                                    color: Colors.green,
                                    textStyle: btntextStyle(20, Colors.white,
                                        FontWeight.w500, FontStyle.normal),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            );
          }),
    ));
  }
}
