import 'package:e_commerce_with_api/users/model/user.dart';
import 'package:e_commerce_with_api/users/user_preferences/user_preferences.dart';
import 'package:get/get.dart';

class CurrentUser extends GetxController {
  final Rx<User> _currentUser =
      User(userId: 0, userName: '', userEmail: '', userPassword: '').obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User? userLocal = await RememberUserPref.readUserInfo();
    _currentUser.value = userLocal!;
  }
}
