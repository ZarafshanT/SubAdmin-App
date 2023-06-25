import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

class Loader extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: primaryColor,
    );
  }
}
