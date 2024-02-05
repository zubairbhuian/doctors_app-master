import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctors_app/models/all_slot_list_model.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/views/all_slots_date_list_screen.dart';
import 'package:doctors_app/widgets/popup_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class AllSlotListController extends GetxController {
  static AllSlotListController get to => Get.find();
  Server server = Server();
  bool obscureText = true;
  bool loader = false;
  final _myBox = Hive.box('doctorBox');

  List<AllSlotData> allSlotList = <AllSlotData>[];

  getAllSlotList() async {
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
        .postRequestWithToken(endPoint: Endpoints.allSlot, body: jsonBody)
        .then((response) {
      kLogger.i(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        kLogger.i(jsonResponse);
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

  void onDeleteSlot(int? id) async {
    PopupDialog.showLoadingDialog();
    final token = _myBox.get("token_1");
    var myId = id.toString();
    try {
      var url = 'https://cureways.webbysys.click/api/v1/slot-delete/$myId';
      kLogger.e(url);
      Dio dio = Dio();
      Map<String, dynamic> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      };
      kLogger.e(headers);
      var res = await dio.get(url, options: Options(headers: headers));

      if (res.statusCode == 200) {
        getAllSlotList();
        PopupDialog.closeLoadingDialog();
        update();
        // Get.to(() => const AllSlotsDateListScreen());
        // Get.rawSnackbar(message: 'Success!', backgroundColor: Colors.green);
      } else {
        Get.rawSnackbar(message: 'Delete field', backgroundColor: Colors.red);
      }
    } catch (e) {
      kLogger.e(e);
    }
  }
}
