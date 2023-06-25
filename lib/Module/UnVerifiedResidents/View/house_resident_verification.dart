import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/block.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/house.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/street.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/phases.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20Text/my_text.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../Widgets/ReusableTextWidget/textstyle.dart';
import '../Controller/house_resident_verification_controller.dart';
import '../Model/measurement.dart';

class HouseResidentVerification extends GetView {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HouseResidentVerificationController>(
            init: HouseResidentVerificationController(),
            builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyBackButton(
                      text: 'House Resident Verification',
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    name:
                                        controller.resident.mobileno.toString(),
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
                                  if (controller
                                          .resident.society![0].structuretype ==
                                      1) ...[
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select Street",
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
                                      child: DropdownSearch<Street>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllStreetsApi(
                                              dynamicId: controller
                                                  .resident.society!.first.id,
                                              type: 'society',
                                              bearerToken: controller
                                                  .userdata.bearerToken);
                                        },
                                        onChanged: (Street? data) {
                                          controller.SelectedStreet(data);
                                        },
                                        selectedItem: controller.streets,
                                        itemAsString: (Street p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select House",
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
                                      child: DropdownSearch<House>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllHousesApi(
                                              dynamicId: controller.streets?.id,
                                              bearerToken: controller
                                                  .userdata.bearerToken,
                                              type: 'street');
                                        },
                                        onChanged: (House? house) {
                                          controller.SelectedHouse(house);

                                          controller
                                                  .houseAddressDetailController
                                                  .text =
                                              "${controller.resident.society!.first.name}${','}${controller.streets!.address}${','}${controller.houses!.address.toString()}";
                                        },
                                        selectedItem: controller.houses,
                                        itemAsString: (House p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    /// House Measurement
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
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller
                                              .housesApartmentsModelApi(
                                                  subadminid: controller
                                                      .userdata.userid!,
                                                  token: controller
                                                      .userdata.bearerToken!,
                                                  type: 'house');
                                        },
                                        onChanged: (Measurement? data) {
                                          controller.SelectedMeasurement(data);
                                        },
                                        selectedItem:
                                            controller.measurementModel,
                                        itemAsString: (Measurement p) {
                                          return p.area.toString() +
                                              ' ' +
                                              p.unit.toString();
                                        },
                                      ),
                                    )
                                  ] else if (controller.resident.society!.first
                                          .structuretype ==
                                      2) ...[
                                    ///Block

                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Select Block",
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
                                      child: DropdownSearch<Block>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllBlocksApi(
                                              dynamicId:
                                                  controller.resident.societyid,
                                              type: 'society',
                                              bearerToken: controller
                                                  .userdata.bearerToken);
                                        },
                                        onChanged: (Block? data) {
                                          controller.SelectedBlock(data);
                                        },
                                        selectedItem: controller.blocks,
                                        itemAsString: (Block p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    ///Street

                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select Street",
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
                                      child: DropdownSearch<Street>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllStreetsApi(
                                              dynamicId: controller.blocks?.id,
                                              type: 'blocks',
                                              bearerToken: controller
                                                  .userdata.bearerToken);
                                        },
                                        onChanged: (Street? data) {
                                          controller.SelectedStreet(data);
                                        },
                                        selectedItem: controller.streets,
                                        itemAsString: (Street p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    ///House

                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select House",
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
                                      child: DropdownSearch<House>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllHousesApi(
                                              dynamicId: controller.streets?.id,
                                              bearerToken: controller
                                                  .userdata.bearerToken,
                                              type: 'street');
                                        },
                                        onChanged: (House? house) {
                                          controller.SelectedHouse(house);

                                          controller
                                                  .houseAddressDetailController
                                                  .text =
                                              "${controller.resident.society!.first.name}${','}${controller.blocks!.address}${','}${controller.streets!.address.toString()}${','}${controller.houses!.address.toString()}";
                                        },
                                        selectedItem: controller.houses,
                                        itemAsString: (House p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    /// House Measurement
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
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller
                                              .housesApartmentsModelApi(
                                                  subadminid: controller
                                                      .userdata.userid!,
                                                  token: controller
                                                      .userdata.bearerToken!,
                                                  type: 'house');
                                        },
                                        onChanged: (Measurement? data) {
                                          controller.SelectedMeasurement(data);
                                        },
                                        selectedItem:
                                            controller.measurementModel,
                                        itemAsString: (Measurement p) {
                                          return p.area.toString() +
                                              ' ' +
                                              p.unit.toString();
                                        },
                                      ),
                                    )
                                  ] else if (controller.resident.society!.first
                                          .structuretype ==
                                      3) ...[
                                    /// Phase
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select Phase",
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
                                      child: DropdownSearch<Phase>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllPhasesApi(
                                              dynamicId:
                                                  controller.resident.societyid,
                                              bearerToken: controller
                                                  .userdata.bearerToken);
                                        },
                                        onChanged: (Phase? data) {
                                          controller.SelectedPhase(data);
                                        },
                                        selectedItem: controller.phases,
                                        itemAsString: (Phase p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    /// Block

                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Select Block",
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
                                      child: DropdownSearch<Block>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllBlocksApi(
                                              dynamicId: controller.phases?.id,
                                              type: 'phase',
                                              bearerToken: controller
                                                  .userdata.bearerToken);
                                        },
                                        onChanged: (Block? data) {
                                          controller.SelectedBlock(data);
                                        },
                                        selectedItem: controller.blocks,
                                        itemAsString: (Block p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    /// Street

                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select Street",
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
                                      child: DropdownSearch<Street>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllStreetsApi(
                                              dynamicId: controller.blocks?.id,
                                              type: 'blocks',
                                              bearerToken: controller
                                                  .userdata.bearerToken);
                                        },
                                        onChanged: (Street? data) {
                                          controller.SelectedStreet(data);
                                        },
                                        selectedItem: controller.streets,
                                        itemAsString: (Street p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    ///House

                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select House",
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
                                      child: DropdownSearch<House>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllHousesApi(
                                              dynamicId: controller.streets?.id,
                                              bearerToken: controller
                                                  .userdata.bearerToken,
                                              type: 'street');
                                        },
                                        onChanged: (House? house) {
                                          controller.SelectedHouse(house);

                                          controller
                                                  .houseAddressDetailController
                                                  .text =
                                              "${controller.resident.society!.first.name.toString()}${','}${controller.phases!.address.toString()}${','}${controller.blocks!.address.toString()}${','}${controller.streets!.address.toString()}${','}${controller.houses!.address.toString()}";
                                          ;
                                        },
                                        selectedItem: controller.houses,
                                        itemAsString: (House p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    /// House Measurement
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
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller
                                              .housesApartmentsModelApi(
                                                  subadminid: controller
                                                      .userdata.userid!,
                                                  token: controller
                                                      .userdata.bearerToken!,
                                                  type: 'house');
                                        },
                                        onChanged: (Measurement? data) {
                                          controller.SelectedMeasurement(data);
                                        },
                                        selectedItem:
                                            controller.measurementModel,
                                        itemAsString: (Measurement p) {
                                          return p.area.toString() +
                                              ' ' +
                                              p.unit.toString();
                                        },
                                      ),
                                    )
                                  ] else if (controller.resident.society!.first
                                          .structuretype ==
                                      5) ...[
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select House",
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
                                      child: DropdownSearch<House>(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllHousesApi(
                                              dynamicId: controller
                                                  .resident.society!.first.id,
                                              bearerToken: controller
                                                  .userdata.bearerToken,
                                              type: 'society');
                                        },
                                        onChanged: (House? house) {
                                          controller.SelectedHouse(house);

                                          controller
                                                  .houseAddressDetailController
                                                  .text =
                                              "${controller.resident.society!.first.name}${','} ${controller.houses!.address.toString()}";
                                        },
                                        selectedItem: controller.houses,
                                        itemAsString: (House p) {
                                          return p.address.toString();
                                        },
                                      ),
                                    ),

                                    /// House Measurement
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
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller
                                              .housesApartmentsModelApi(
                                                  subadminid: controller
                                                      .userdata.userid!,
                                                  token: controller
                                                      .userdata.bearerToken!,
                                                  type: 'house');
                                        },
                                        onChanged: (Measurement? data) {
                                          controller.SelectedMeasurement(data);
                                        },
                                        selectedItem:
                                            controller.measurementModel,
                                        itemAsString: (Measurement p) {
                                          return p.area.toString() +
                                              ' ' +
                                              p.unit.toString();
                                        },
                                      ),
                                    )
                                  ],
                                  MyTextFormField(
                                    validator: emptyStringValidator,
                                    maxLines: null,
                                    controller:
                                        controller.houseAddressDetailController,
                                    hintText: 'House / Apartment Adreess ',
                                    labelText: 'House / Apartment Adreess ',
                                  ),
                                  MyText(name: 'Vehicle Number'),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      controller:
                                          controller.vehicleNoController,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white70,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Vehicle Number',
                                          hintStyle: TextStyle(
                                            decorationStyle:
                                                TextDecorationStyle.dashed,
                                          )),
                                    ),
                                  ),
                                  Center(
                                    child: MyButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          controller.verifyResidentApi(
                                              houseaddress: controller
                                                  .houseAddressDetailController
                                                  .text,
                                              residentid: controller
                                                  .resident.residentid,
                                              status: 1,
                                              token: controller
                                                  .userdata.bearerToken!,
                                              bid: controller.blocks?.id ?? 0,
                                              measurementid: controller
                                                  .measurementModel!.id,
                                              pid: controller.phases?.id ?? 0,
                                              propertyid:
                                                  controller.houses!.id!,
                                              sid: controller.streets?.id ?? 0,
                                              vechileno: controller
                                                  .vehicleNoController.text);
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
      ),
    );
  }
}
