import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/const_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final VoidCallback? onLeading;
  final double? preferredHeight;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final bool? hasBackBTN;

  const CustomAppBar(
      {super.key,
      this.title,
      this.onLeading,
      this.preferredHeight,
      this.actions,
       this.centerTitle=true,
       this.hasBackBTN=true, this.bottom,
    });

// Specify the desired height of the AppBar
  @override
  Size get preferredSize => Size.fromHeight(preferredHeight ?? 66.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 6,
      centerTitle: centerTitle,
      leadingWidth: 60,
      backgroundColor: kPrimaryColor,
      foregroundColor: kTextColor,
      bottom: bottom,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white),
      // appbar leading
      leading:hasBackBTN==true? GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Center(
          child: CircleAvatar(
            radius: 24,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: kWhite,
            ),
          ),
        ),
      ):null,
      // appbar title
      title: title,
      // appbar actions),
    );
  }
}

class AppDefaultBar extends StatelessWidget {
final  String? title;
final   String? userNAme;
final bool? hasBackBTN;

const  AppDefaultBar({
     this.title,
     this.userNAme,
    Key? key, this.hasBackBTN =true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 6,
      centerTitle: true,
      leadingWidth: 60,
      backgroundColor: kPrimaryColor,
      foregroundColor: kTextColor,
      // appbar leading
      leading:hasBackBTN==true? GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Center(
          child: CircleAvatar(
            radius: 24,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: kWhite,
            ),
          ),
        ),
      ):null,
      // appbar title
      title:Text(title?.toUpperCase()??""),
      // appbar actions),
    );
  }
}
