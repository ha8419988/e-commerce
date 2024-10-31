import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class RememberUserPref {
  static const keyCurrentUser = 'currentUser';

  static Future<void> storeUserInfo(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(user.toJson());
    await preferences.setString(keyCurrentUser, userJsonData);
  }

  static Future<User?> readUserInfo() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString(keyCurrentUser);
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }

  static Future<void> removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(keyCurrentUser);
  }
}
