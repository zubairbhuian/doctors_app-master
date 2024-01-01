import 'dart:convert';

import 'package:doctors_app/models/all_slot_list_model.dart';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AllSlotListController extends GetxController {
  Server server = Server();
  bool obscureText = true;
  bool loader = false;
  final _myBox = Hive.box('doctorBox');
  List<AllSlotData> allSlotList = <AllSlotData>[];

  getAllSlotList() async {
    var doctorID = _myBox.get('id');
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'id': doctorID,
    };
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.allSlot, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var allSlotData = AllSlotListModel.fromJson(jsonResponse);

        allSlotList = <AllSlotData>[];
        allSlotList.addAll(allSlotData.data!);

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
