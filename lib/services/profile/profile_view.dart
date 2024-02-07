import 'dart:io';
import 'package:doctors_app/controllers/profile_controller.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/utils/int_extensions.dart';
import 'package:doctors_app/widgets/custom_textfield.dart';
import 'package:doctors_app/widgets/network_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileController = ProfileController();

  @override
  void didChangeDependencies() {
    profileController = Get.put(ProfileController());
    profileController.getUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile
            100.height,
            Center(
              child: GetBuilder<ProfileController>(
                  init: ProfileController(),
                  builder: (controller) {
                    File? imgFile = controller.profileImgFile;
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(34, 34, 34, 0.138),
                              offset: Offset(4, 8),
                              blurRadius: 24,
                              spreadRadius: 4,
                            )
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(800),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffECEDF2),
                              radius: 60,
                              child: imgFile == null
                                  ?  NetworkImg(
                                      controller.userPhoto,
                                      errUrl: 'assets/images/default_user.png',
                                    )
                                  : Image(
                                      width: double.infinity,
                                      height: double.infinity,
                                      image: FileImage(imgFile),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: -10,
                            bottom: 10,
                            child: GestureDetector(
                              onTap: () {
                                controller.onPickProfileImage();
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    Color.fromARGB(255, 234, 231, 231),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: kWhite,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    );
                  }),
            ),

            // user info
            40.height,
            const Text(
              "User Information",
              style: TextStyle(
                  color: kTextColor, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            10.height,
            GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (controller) {
                  return CustomTextField2(
                    label: const Text("Full Name"),
                    controller: controller.fullNameController,
                  );
                }),
            GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (controller) {
                  return CustomTextField2(
                    label: const Text("Email"),
                    controller: controller.emailController,
                  );
                }),
            // Logout Btn
            10.height,
            GestureDetector(
              onTap: () {
                controller.onLogOut();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


