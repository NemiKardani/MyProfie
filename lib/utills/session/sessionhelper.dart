import 'dart:convert';
import 'dart:developer';

import 'package:my_profile/model/user_responce.dart';
import 'package:my_profile/utills/session/sp_string.dart';

import 'null_check_oprations.dart';
import 'sessionmanager.dart';

class SessionHelper {
  SessionHelper._();

  static final SessionHelper _instance = SessionHelper._();

  factory SessionHelper() {
    return _instance;
  }

  Future<UserResponse> setLoginData(UserResponse loginResponce) async {
    // save user values in shared pref
    await SessionManager.setStringValue(
        SpString.spLogin, jsonEncode(loginResponce.toJson()));

    return loginResponce;
  }

  static UserResponse? loginSavedData;

  Future<UserResponse?> getLoginData() async {
    String response = await SessionManager.getStringValue(SpString.spLogin);
    if (CheckNullData.checkNullOrEmptyString(response)) {
      return null;
    } else {
      //loginSavedData = UserResponce.fromJson(jsonDecode(response));
      log(response);
      //String data = json.decode(response);
      return UserResponse.fromJson(jsonDecode(response));
    }
  }

  Future<int> setAttemptIntroData(int attempt) async {
    // save user values in shared pref
    await SessionManager.setIntValue(SpString.spIntro, attempt);

    return await getAttemptIntroData();
  }

  Future<int> getAttemptIntroData() async {
    // save user values in shared pref

    return await SessionManager.getIntValue(SpString.spIntro);
  }
}
