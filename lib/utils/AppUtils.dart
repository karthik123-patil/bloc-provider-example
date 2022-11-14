import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class AppUtils {
  void showSuccessToastMsg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg,
      textColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }

  void showErrorToastMsg(String msg) {
    Fluttertoast.showToast(msg: msg,
      textColor: Colors.white,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }
}