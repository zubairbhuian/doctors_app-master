import 'package:doctors_app/services/profile/profile_view.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/views/about_us_screen.dart';
import 'package:doctors_app/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EntrypointView extends StatefulWidget {
  const EntrypointView({super.key});

  @override
  State<EntrypointView> createState() => _EntrypointViewState();
}

class _EntrypointViewState extends State<EntrypointView> {
  int pageIndex = 0;

  final pages = [
    const DashBoardScreen(),
    AboutusScreen(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kTextColorLight,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/home_outline.svg"),
                activeIcon: SvgPicture.asset("assets/icons/home_filed.svg"),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/about_outline.svg"),
                activeIcon: SvgPicture.asset("assets/icons/about_field.svg"),
                label: "About"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/profile_outline.svg"),
                activeIcon: SvgPicture.asset("assets/icons/profile_field.svg"),
                label: "Profile"),
          ]),
    );
  }
}
