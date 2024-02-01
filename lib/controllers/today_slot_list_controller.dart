import 'dart:convert';

import 'package:doctors_app/models/today_slot_list_model.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TodaySlotListController extends GetxController {
  Server server = Server();
  bool obscureText = true;
  bool loader = false;
  final _myBox = Hive.box('doctorBox');
  List<TodaySlotData> todaySlotList = <TodaySlotData>[];

  getTodaySlotList() async {
    var doctorID = _myBox.get('userId');
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'id': doctorID,
    };
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.todaySlot, body: jsonBody)
        .then((response) {
      kLogger.i(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        kLogger.i(jsonResponse);
        var todaySlotData = TodaySlotListModel.fromJson(jsonResponse);

        todaySlotList = <TodaySlotData>[];
        todaySlotList.addAll(todaySlotData.data!);

        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
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
