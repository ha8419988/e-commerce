import 'package:e_commerce_with_api/users/auth/login_sreen.dart';
import 'package:e_commerce_with_api/users/auth/signup_screen.dart';
import 'package:e_commerce_with_api/users/fragments/dashboard_of_fragments.dart';
import 'package:e_commerce_with_api/users/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clothes APP',
        theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.blue)),
        home: FutureBuilder(
          future: RememberUserPref.readUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return DashboardOfFragments();
            } else {
              return const LoginSreen();
            }
          },
        ));
  }
}
