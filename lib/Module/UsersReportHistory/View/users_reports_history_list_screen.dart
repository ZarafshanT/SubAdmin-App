
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';


class UsersReportsHistoryListScreen extends StatelessWidget {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String eventstartdate = dateTime.toString().split(' ')[0];

    return Scaffold(
      appBar: AppBar(
        title: Text('Users Reports List'),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // showSearch(
                  //     context: context,
                  //     delegate: UserScreenCustomSearchDelegate());
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              title: Text("Report Full Detail"),
              content: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Report Title: Water Problem',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' Report Description: A problem statement is a concise description of an issue to be addressed or a condition to be improved upon. It identifies the gap between the current (problem) state and desired (goal) state of a process or product. Focusing on the facts, the problem statement should be designed to address the Five Ws. ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Reporting Date:$eventstartdate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Progress Date: $eventstartdate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Completed Date: $eventstartdate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: new Container(
                            padding: new EdgeInsets.all(16.0),
                            decoration: new BoxDecoration(
                                color: const Color(0xFF33b17c),
                                borderRadius: BorderRadius.circular(20)),
                            child: new Text(
                              'Report Okay',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 170,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: ListTile(
                        title: Text('Report Title'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Date: ${eventstartdate}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5),
          ),
        ),
      ),
    );
  }
}
