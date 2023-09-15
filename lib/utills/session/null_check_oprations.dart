import 'package:flutter/material.dart';

class CheckNullData {
  static void hideSoftInputKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool checkNullOrEmptyString(String str) {
    if (str.isEmpty || str == "") {
      return true;
    } else {
      return false;
    }
  }

  static bool checkLocalOrServerImage(String str) {
    if (str.contains("https://")) {
      return true;
    } else {
      return false;
    }
  }

  static String trimAndGetString(String str) {
    if (str.isEmpty || str == "") {
      return "";
    } else {
      return str.trim();
    }
  }
}
