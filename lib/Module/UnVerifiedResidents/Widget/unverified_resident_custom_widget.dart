import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';

class HeadingText extends StatelessWidget {
  HeadingText({required this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Text(
        text!,
        style: GoogleFonts.ubuntu(
            fontStyle: FontStyle.normal,
            // color: secondaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: HexColor('#4D4D4D')),
      ),
    );
  }
}

class UnverifiedCard extends StatelessWidget {
  UnverifiedCard(
      {required this.onTap,
      required this.imgUrl,
      required this.name,
      required this.mobileno});

  void Function()? onTap;

  String imgUrl;
  String name;
  String mobileno;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: SizedBox(
          width: 200,
          height: MediaQuery.of(context).size.height * .14,
          child: Card(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, left: 8),
                    child: Container(
                      width: 70.4,
                      height: 64,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imgUrl), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: HexColor('#404345')),
                        ),
                        Text(
                          mobileno,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: primaryColor),
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * 0.03,
                      child: Center(
                          child: Text(
                        'Unverified',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.0015,
                            fontWeight: FontWeight.w500),
                      )),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
