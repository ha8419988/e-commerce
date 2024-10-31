import 'package:e_commerce_with_api/users/auth/login_sreen.dart';
import 'package:e_commerce_with_api/users/user_preferences/current_user.dart';
import 'package:e_commerce_with_api/users/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});

  final CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Image.asset(
            'assets/images/man.png',
            width: 240,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        userInfo(Icons.person, _currentUser.user.userName),
        const SizedBox(
          height: 20,
        ),
        userInfo(Icons.email, _currentUser.user.userEmail),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: signout,
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void signout() async {
    var result = await Get.dialog(AlertDialog(
      backgroundColor: Colors.grey,
      title: const Text(
        'logout',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text('Do you want logout ???'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'No',
              style: TextStyle(color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Get.back(result: 'loggedOut');
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.black),
            )),
      ],
    ));
    if (result == 'loggedOut') {
      RememberUserPref.removeUser().then((value) {
        Get.off(const LoginSreen());
      });
    }
  }

  Widget userInfo(
    IconData icon,
    String userData,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(children: [
        Icon(icon),
        const SizedBox(
          width: 16,
        ),
        Text(
          userData,
          style: const TextStyle(
            fontSize: 15,
          ),
        )
      ]),
    );
  }
}
