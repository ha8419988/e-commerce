// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_api/users/fragments/favorites_fragment.dart';
import 'package:e_commerce_with_api/users/fragments/home_fragment.dart';
import 'package:e_commerce_with_api/users/fragments/order_fragment.dart';
import 'package:e_commerce_with_api/users/fragments/profile_fragment.dart';
import 'package:e_commerce_with_api/users/user_preferences/current_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardOfFragments extends StatelessWidget {
  CurrentUser userObx = Get.put(CurrentUser());
  RxInt index = 0.obs;
  final List<Widget> _fragmentScreens = [
    const HomeFragment(),
    const FavoritesFragment(),
    const OrderFragment(),
    ProfileFragment()
  ];

  final List _navigationButton = [
    {
      'active_icon': Icons.home,
      'non_active_icon': Icons.home,
      'label': 'Home',
    },
    {
      'active_icon': Icons.favorite,
      'non_active_icon': Icons.favorite_border,
      'label': 'Favorite',
    },
    {
      'active_icon': FontAwesomeIcons.boxOpen,
      'non_active_icon': FontAwesomeIcons.box,
      'label': 'Order',
    },
    {
      'active_icon': Icons.person,
      'non_active_icon': Icons.person_outline,
      'label': 'Profile',
    },
  ];
  DashboardOfFragments({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CurrentUser(),
        initState: (state) {
          userObx.getUserInfo();
        },
        builder: (context) {
          return Scaffold(
            body: SafeArea(child: Obx(() => _fragmentScreens[index.value])),
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text('Dashboard'),
            ),
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                  items: List.generate(4, (index) {
                    var navBtn = _navigationButton[index];
                    return BottomNavigationBarItem(
                        label: navBtn['label'],
                        activeIcon: Icon(navBtn['active_icon']),
                        backgroundColor: Colors.black,
                        icon: Icon(navBtn['non_active_icon']));
                  }),
                  currentIndex: index.value,
                  onTap: (value) {
                    index.value = value;
                  },
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white24,
                )),
          );
        });
  }
}
