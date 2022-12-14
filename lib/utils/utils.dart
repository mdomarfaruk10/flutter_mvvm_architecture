

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static fieldFocusChange(BuildContext context, FocusNode curent,FocusNode nextFocus){
    curent.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static void FlushBerErrorMessage(String message, BuildContext context){

    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      message: message,
    )..show(context)
    );
  }

  static ScankBar(String message, BuildContext context){

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );

  }
}