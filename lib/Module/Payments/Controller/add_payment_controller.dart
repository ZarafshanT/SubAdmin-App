import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController
{


   List   <TextEditingController> controllers = [];
   List  <TextField> mytextformfields= [];
   final controller = TextEditingController();
   final label = TextEditingController();


   setDynamicTextFields({required controller ,required labelText})
   {
      mytextformfields.add(




          TextField(
             controller: controller,
             decoration: InputDecoration(
                 hintText:labelText
             ),

          )

      );
 controllers.add(controller);
 label.clear();
 update();


   }
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    label.dispose();
  }





}