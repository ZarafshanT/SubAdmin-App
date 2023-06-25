import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';

class ParticularGuestArrivalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Particular Guest Detail'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(20)),
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guest Name',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Fuzail Raza',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Address:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '03365067568',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Vehcile No',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rimi-3055',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.0))),
                                contentPadding: EdgeInsets.only(top: 10.0),
                                title: Text("Guest Arrival Full Detail"),
                                content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Guest Name: Fuzail Raza',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Vehcile No:Rimi-97654',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Check in Date:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Check out Date:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: new Container(
                                              padding: new EdgeInsets.all(16.0),
                                              decoration: new BoxDecoration(
                                                  color:
                                                      const Color(0xFF33b17c),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: new Text(
                                                'Report Okay',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontFamily:
                                                      'helvetica_neue_light',
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
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'logo',
                              ),
                            ),
                            title: Text('Guest Name'),
                            subtitle: Text('Date:'),
                            trailing: Wrap(children: []),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
