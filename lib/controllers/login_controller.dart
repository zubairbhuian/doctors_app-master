import 'dart:convert';

import 'package:doctors_app/models/login_response_model.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/services/user_service.dart';
import 'package:doctors_app/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'global_controller.dart';

class LoginController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool loader = false;
  final _myBox = Hive.box('doctorBox');

  loginOnTap(BuildContext context, String? email, String? password) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {'email': email, 'password': password, 'role_id': '4'};
    String jsonBody = json.encode(body);

    server
        .postRequest(endPoint: Endpoints.doctorLogin, body: jsonBody)
        .then((response) {
      kLogger.i(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        kLogger.i(jsonResponse);
        var loginData = LoginResponseModel.fromJson(jsonResponse);
        var bearerToken = 'Bearer ${loginData.token}';
        userService.saveBoolean(key: 'is-user', value: true);
        userService.saveString(key: 'token', value: loginData.token);
        userService.saveString(
            key: 'user-id', value: loginData.data!.doctorId.toString());
        userService.saveString(
            key: 'userName', value: loginData.data!.name.toString());
        userService.saveString(
            key: 'email', value: loginData.data!.email.toString());

        _myBox.put('id', loginData.data!.doctorId);
        _myBox.put('name', loginData.data!.name);
        _myBox.put('email', loginData.data!.email);

        Server.initClass(token: bearerToken);
        Get.put(GlobalController()).initController();
        emailController.clear();
        passwordController.clear();
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.off(() => const DashBoardScreen());
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
            message: 'Please enter valid email address and password');
      }
    });
  }
}
