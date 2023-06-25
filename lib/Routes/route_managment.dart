import 'package:get/get.dart';
import 'package:societyadminapp/Module/AddNoticeBoard/View/add_notice_board_screen.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Blocks/View/add_blocks.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Houses/View/add_houses.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Streets/View/add_streets.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/View/blocks.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/View/streets.dart';
import 'package:societyadminapp/Module/AdminProfile/View/admin_profile_screen.dart';
import 'package:societyadminapp/Module/Bills/View/bills.dart';
import 'package:societyadminapp/Module/Events/View/events_screen.dart';
import 'package:societyadminapp/Module/Events/View/view_event_images_screen.dart';
import 'package:societyadminapp/Module/GateKepeer/View/gate_keeper_screen.dart';
import 'package:societyadminapp/Module/ImageHeroView/viewimage.dart';
import 'package:societyadminapp/Module/Login/View/login.dart';
import 'package:societyadminapp/Module/Measurements/View/add_measurements.dart';
import 'package:societyadminapp/Module/Measurements/View/measurements_view.dart';
import 'package:societyadminapp/Module/NoticeBoard/View/notice_board_screen.dart';
import 'package:societyadminapp/Module/Report%20Notifications/View/report_notifications_screen.dart';
import 'package:societyadminapp/Module/Society%20Apartment%20Bills/View/generate_society_apartment_bills.dart';
import 'package:societyadminapp/Module/Splash/View/splash_screen.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/View/apartment_resident_verification.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/View/unverified_residents.dart';
import 'package:societyadminapp/Module/UpdateNoticeBoard/View/update_notice_screen.dart';
import 'package:societyadminapp/Module/View%20Residents/View/view_residents.dart';
import 'package:societyadminapp/Module/ViewReports/View/reported_residents_screen.dart';
import 'package:societyadminapp/Module/ViewReports/View/residents_report_list_screen.dart';
import 'package:societyadminapp/Routes/screen_binding.dart';
import 'package:societyadminapp/Routes/set_routes.dart';

import '../Module/Add Event/View/add_event.dart';
import '../Module/Add Event/View/update_event.dart';
import '../Module/AddGateKepeer/View/add_gatekepeer.dart';
import '../Module/AddLocalBuildingDetail/AddLocalBuildingApartments/View/add_local_building_apartment_screen.dart';
import '../Module/AddLocalBuildingDetail/AddLocalBuildingFloors/View/add_local_building_floors_screen.dart';
import '../Module/AddLocalBuildingDetail/LocalBuilding/View/local_building_screen.dart';
import '../Module/AddLocalBuildingDetail/LocalBuildingApartments/View/local_building_apartment_screen.dart';
import '../Module/AddLocalBuildingDetail/LocalBuildingFloors/View/local_building_floors_screen.dart';
import '../Module/AddResident/View/add_resident.dart';
import '../Module/AddSocietyDetail/Add Phases/View/add_phases.dart';
import '../Module/AddSocietyDetail/AddBlockOrPhaseBuilding/View/add_block_building_screen.dart';
import '../Module/AddSocietyDetail/AddBlockOrPhaseBuildingApartment/View/add_block_or_phase_building_floors_screen.dart';
import '../Module/AddSocietyDetail/AddBlockOrPhaseBuildingFloor/View/add_block_or_phase_building_floors_screen.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildingApartment/View/add_society_building_apartment.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildingFloors/View/add_society_building_floor_screen.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildings/View/add_society__buildings_screen.dart';
import '../Module/AddSocietyDetail/BlockBuildingOrStreet/View/block_building_or_street_screen.dart';
import '../Module/AddSocietyDetail/BlockOrPhaseBuilding/View/block_building_screen.dart';
import '../Module/AddSocietyDetail/BlockOrPhaseBuildingApartment/View/block_or_phase_building_apartment_screen.dart';
import '../Module/AddSocietyDetail/BlockOrPhaseBuildingFloor/View/block_or_phase_building_floor_screen.dart';
import '../Module/AddSocietyDetail/BlockOrSocietyBuilding/View/block_or_society_building_screen.dart';
import '../Module/AddSocietyDetail/BlocksOrBuildings/View/blocks_or_buildings_screen.dart';
import '../Module/AddSocietyDetail/Houses/View/houses.dart';
import '../Module/AddSocietyDetail/PhaseBuildingOrBlock/View/phase_building_or_block_screen.dart';
import '../Module/AddSocietyDetail/PhaseOrSocietyBuilding/View/phase_or_society_building_screen.dart';
import '../Module/AddSocietyDetail/Phases/View/phases.dart';
import '../Module/AddSocietyDetail/SocietyBuildingApartment/View/society_building_apartment_screen.dart';
import '../Module/AddSocietyDetail/SocietyBuildingFloor/View/society_building_floor_screen.dart';
import '../Module/AddSocietyDetail/SocietyBuildings/View/society_building_screen.dart';
import '../Module/AddSocietyDetail/StreetOrBuilding/View/street_or_building_screen.dart';
import '../Module/AddSocietyDetail/StructureType5HouseOrBuildingMiddleWare/View/structure_type5_house_or_building_screen.dart';
import '../Module/Finance Manger/Add Finance Manager/View/add_finance_manager.dart';
import '../Module/Finance Manger/Update Finance Manager Details/View/update_finance_manager_details.dart';
import '../Module/Finance Manger/View Finance Manager/View/view_finance_manager.dart';
import '../Module/GatekeeperDetail/View/gatekeeper_details.dart';
import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/House Bills/View/generate_house_bill.dart';
import '../Module/House Bills/View/generated_house_bill.dart';
import '../Module/Residental Emergency/View/residential_emergency_screen.dart';
import '../Module/Society Apartment Bills/View/generated_society_apartment_bills.dart';
import '../Module/UnVerifiedResidents/View/house_resident_verification.dart';
import '../Module/UnVerifiedResidents/View/local_building_apartment_resident_verification.dart';
import '../Module/UpdateGateKeeper/View/updategatekeeper_detail_screen.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: splashscreen,
          page: () => SplashScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: login,
          page: () => Login(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: homescreen,
          page: () => HomeScreen(),
          binding: ScreenBindings(),
          transition: Transition.rightToLeft),
      GetPage(
          name: viewuser,
          page: () => ViewResidents(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addresident,
          page: () => AddResident(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      // GetPage(
      //     name: updateresidentdetails,
      //     page: () => UpdateResidentDetails(),
      //     binding: ScreenBindings(),
      //     ),
      // GetPage(
      //     name: chatscreen,
      //     page: () => ChatScreen(),
      //     binding: ScreenBindings(),
      //     ),
      GetPage(
          name: gatekeeperscreen,
          page: () => GateKeeperScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addgatekeeperscreen,
          page: () => AddGateKeeper(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: updategatekeeperscreen,
          page: () => UpdateGateKepeerScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: gateKepeerDetailScreen,
          page: () => GateKepeerDetailScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: eventsscreen,
          page: () => EventsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addeventsscreen,
          page: () => AddEventsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: updateevent,
          page: () => UpdateEvent(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: adminprofilescreen,
          page: () => AdminProfileScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: reportnotificationsscreen,
          page: () => ReportNotificationsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: viewreportscreen,
          page: () => ReportedResidentListScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: userreportslistscreen,
          page: () => UserReportsListScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: noticeboardscreen,
          page: () => NoticeBoardScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addnoticeboardscreen,
          page: () => AddNoticeBoardScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: updatenoticeboardscreen,
          page: () => UpdateNoticeBoardScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: vieweventimages,
          page: () => ViewEventImages(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: viewheroimage,
          page: () => ViewImage(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addphases,
          page: () => AddPhases(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: phasess,
          page: () => Phases(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: blocks,
          page: () => Blocks(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addblocks,
          page: () => AddBlocks(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: streets,
          page: () => Street(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addstreets,
          page: () => AddStreets(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
        name: addhouses,
        page: () => AddHouses(),
        binding: ScreenBindings(),
      ),
      GetPage(
          name: houses,
          page: () => Houses(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: unverifiedresident,
          page: () => UnVerifiedResident(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: addmeasurements,
          page: () => AddMeasurements(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: measurementview,
          page: () => MeasurementView(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: houseresidentverification,
          page: () => HouseResidentVerification(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: generatehousebills,
          page: () => GenerateHouseBill(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: generatedhousebills,
          page: () => GeneratedHouseBill(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: blockorbuilding,
          page: () => BlockOrBuilding(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: societybuildingscreen,
          page: () => SocietyBuildingScreen(),
          binding: ScreenBindings(),
          transition: Transition.rightToLeft),

      GetPage(
          name: addsocietybuildingscreen,
          page: () => AddSocietyBuildingScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: societybuildingfloorsscreen,
          page: () => SocietyBuildingFloorsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addsocietybuildingfloors,
          page: () => AddSocietyBuildingFloors(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: societybuildingapartmentscreen,
          page: () => SocietyBuildingApartmentScreen(),
          binding: ScreenBindings(),
          transition: Transition.rightToLeft),

      GetPage(
          name: addsocietybuildingapartmentsscreen,
          page: () => AddSocietyBuildingApartmentsScreen(),
          binding: ScreenBindings(),
          transition: Transition.rightToLeft),
      GetPage(
          name: streetorbuildingscreen,
          page: () => StreetOrBuildingScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: blockorsocietybuilding,
          page: () => BlockOrSocietyBuilding(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: phaseorsocietybuilding,
          page: () => PhaseOrSocietyBuilding(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: blockbuildingorstreet,
          page: () => BlockBuildingOrStreet(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: blockbuilding,
          page: () => BlockBuilding(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: addblockbuildingscreen,
          page: () => AddBlockBuildingScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: phasebuildingorblock,
          page: () => PhaseBuildingOrBlock(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: blockorphasebuildingfloorsscreen,
          page: () => BlockOrPhaseBuildingFloorsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addblockorphasebuildingfloors,
          page: () => AddBlockOrPhaseBuildingFloors(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: blockOrphasebuildingapartmentsscreen,
          page: () => BlockOrPhaseBuildingApartmentsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addblockorphasebuildingapartmentsscreen,
          page: () => AddBlockOrPhaseBuildingApartmentsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: localbuildingscreen,
          page: () => LocalBuildingScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: localbuildingfloorsscreen,
          page: () => LocalBuildingFloorsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),

      GetPage(
          name: addlocalbuildingfloors,
          page: () => AddLocalBuildingFloors(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: localbuildingapartmentscreen,
          page: () => LocalBuildingApartmentScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: addlocalbuildingapartmentsscreen,
          page: () => AddLocalBuildingApartmentsScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: structureType5HouseOrBuildingMiddlewareScreen,
          page: () => StructureType5HouseOrBuildingMiddlewareScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: apartmentresidentverification,
          page: () => ApartmentResidentVerification(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: localBuildingApartmentResidentVerification,
          page: () => LocalBuildingApartmentResidentVerification(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: bills,
          page: () => Bills(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: generatesocietyapartmentbills,
          page: () => GenerateSocietyApartmentBills(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: generatedsocietyapartmentbills,
          page: () => GeneratedSocietyApartmentBills(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
      GetPage(
          name: residentialEmergencyScreen,
          page: () => ResidentialEmergencyScreen(),
          binding: ScreenBindings(),
          transition: Transition.leftToRight),
           GetPage(
          name: viewFinanceManager,
          page: () => ViewFinanceManager(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: addFinanceManager,
          page: () => AddFinanceManager(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: updateFinanceManager,
          page: () => UpdateFinanceManagerDetails(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
          
    ];
  }
}
