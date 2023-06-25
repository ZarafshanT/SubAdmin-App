// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:societyadminapp/Module/View%20Residents/Controller/view_residents_controller.dart';

// import '../../../Constants/api_routes.dart';
// import '../../../Constants/constants.dart';
// import '../../../Routes/set_routes.dart';
// class ResidentSearchDelegate extends SearchDelegate {
//   final ViewResidentController viewResidentController =Get.put(ViewResidentController());

//   final int? subadminid;
//   final String? token;

//   List<String> searchTerms = [
//     "Apple",
//     "Banana",
//     "Mango",
//     "Pear",
//     "Watermelons",
//     "Blueberries",
//     "Pineapples",
//     "Strawberries"
//   ];

//   ResidentSearchDelegate(this.subadminid, this.token);

// // first overwrite to
// // clear the search text
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }

// // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }

// // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {

//     return FutureBuilder(
//         future: viewResidentController.searchResidentsApi(subadminid!,token!, query),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return  GetBuilder<ViewResidentController>(
//               init: ViewResidentController(),
//               builder: (controller) {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, index) {
//                     return         ListTile(
//                       leading: GestureDetector(
//                         onTap: (){
//                           Get.toNamed (viewheroimage ,arguments: [
//                            Api. imageBaseUrl  +snapshot.data![index].image.toString(),Api.imageBaseUrl  +snapshot.data![index].image.toString()]);


//                         },

//                         child: CircleAvatar(
//                           radius: 30,
//                           backgroundImage:
//                           NetworkImage(Api.imageBaseUrl  +snapshot.data![index].image.toString()),
//                         ),
//                       ),
//                       title: Text(snapshot.data![index].firstname
//                           .toString() +
//                           " " +
//                           snapshot.data![index].lastname
//                               .toString()),
//                       subtitle: Text(
//                           snapshot.data![index].address.toString()),
//                       trailing: Wrap(children: [
//                         InkWell(
//                           onTap: () {
//                          controller.DeleteResidentsApi(   snapshot.data![index].residentid, controller.userdata.bearerToken!);
                        
//                           },
//                           child: Icon(
//                             Icons.delete,
//                             color: primaryColor,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         InkWell(
//                           onTap: () {

//                             Get.offAndToNamed(
//                                 updateresidentdetails,
//                                 arguments: [
//                                   snapshot.data![index],
//                                   controller.userdata
//                                 ]);
//                           },
//                           child: Icon(
//                             Icons.edit,
//                             color: primaryColor,
//                           ),
//                         ),
//                       ]),
//                     );
//                   },
//                 );
//               }
//             );
//           } else if (snapshot.hasError) {
//             return Icon(Icons.error_outline);
//           } else {
//             return CircularProgressIndicator();
//           }
//         });


//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {

//     return Center(child: Text("Searh Here"));
//   }
// // last overwrite to show the
// // querying process at the runtime

// }
