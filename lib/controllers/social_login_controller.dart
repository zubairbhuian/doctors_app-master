import 'dart:convert';

import 'package:doctors_app/models/social_login_response_model.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/services/user_service.dart';
import 'package:doctors_app/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'global_controller.dart';

class SocialLoginController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  final _myBox = Hive.box('doctorBox');

  loginOnTap(BuildContext context, String? name, String? email,String? photoUrl) async {
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {'name': name, 'email': email, 'role_id': '3'};
    String jsonBody = json.encode(body);

    server
        .postRequest(endPoint: Endpoints.socialLogin, body: jsonBody)
        .then((response) {

      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var loginData = SocialLoginResponseModel.fromJson(jsonResponse);
        var bearerToken = 'Bearer ${loginData.token}';
        userService.saveBoolean(key: 'is-user', value: true);
        userService.saveString(key: 'token', value: loginData.token);
        userService.saveString(
            key: 'user-id', value: loginData.data!.id.toString());
        userService.saveString(
            key: 'userName', value: loginData.data!.name.toString());
        userService.saveString(
            key: 'email', value: loginData.data!.email.toString());
        _myBox.put('userId', loginData.data!.id.toString());
        _myBox.put('userName', loginData.data!.name.toString());

        _myBox.put('email', loginData.data!.email.toString());
        _myBox.put('userPhoto', photoUrl);
        kLogger.e('User Id:   ${_myBox.get('userId')}');
        kLogger.e('User Id:   ${_myBox.get('userPhoto')}');
        kLogger.e('User Name:   ${_myBox.get('userName')}');
        Server.initClass(token: bearerToken);
        Get.put(GlobalController()).initController();

        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.off(() => const DashBoardScreen());
      } else {
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }
}
