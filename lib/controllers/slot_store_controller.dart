import 'dart:convert';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/services/user_service.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
class SlotStoreController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool obscureText = true;
  bool loader = false;
  final _myBox = Hive.box('doctorBox');

  storeSlotOnTap(
    BuildContext context,
    String? date,
    String? slotFrom,
    String? slotTo,
    String? consultancyDuration,
    String? status,
  ) async {
    var doctorID = _myBox.get('userId');
    kLogger.e(doctorID);
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'doctor_id': doctorID,
      'date': date,
      'slot_from': slotFrom,
      'slot_to': slotTo,
      // 'consultancy_duration': consultancyDuration,
      'status': status
    };
    kLogger.i(body);
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.slotStore, body: jsonBody)
        .then((response) {
      kLogger.i(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        kLogger.i(jsonResponse);

        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });

        Get.rawSnackbar(message: 'Successful!', backgroundColor: Colors.green);
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
            message: 'Please enter valid Input', backgroundColor: Colors.red);
      }
    });
  }
}
