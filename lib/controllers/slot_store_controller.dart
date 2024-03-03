
import 'package:dio/dio.dart';
import 'package:doctors_app/models/main_slot_model.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/services/user_service.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/widgets/popup_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SlotStoreController extends GetxController {
  UserService userService = UserService();
  Server server = Server();

  final TextEditingController referredDate = TextEditingController();
  final TextEditingController slotFromTime = TextEditingController();
  final TextEditingController slotToTime = TextEditingController();
  final TextEditingController consultancyDuration = TextEditingController();

  bool obscureText = true;
  bool loader = false;
  final _myBox = Hive.box('doctorBox');
  TabController? tabController;
  List<MainSlot> slotList = [];
  List<MainSlot> slotFilteredList = [];
  List closeList = ["yes", "no"];
  List<String> daysOfWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  createSlot(
      {required String days,
      required String firstSlotFrom,
      required String firstSlotTo,
      required int consultancyFirstSlotDuration,
      required String secondSlotFrom,
      required String secondSlotTo,
      required int consultancySecondSlotDuration,
      required String thirdSlotFrom,
      required String thirdSlotTo,
      required int consultancyThirdSlotDuration,
      required String close}) async {
    var doctorID = _myBox.get('userId');
    loader = true;

    Map body = {
      "doctor_id": doctorID,
      "days": days,
      "first_slot_from": firstSlotFrom,
      "first_slot_to": firstSlotTo,
      "consultancy_first_slot_duration": consultancyFirstSlotDuration,
      "second_slot_from": secondSlotFrom,
      "consultancy_second_slot_duration": consultancySecondSlotDuration,
      "second_slot_to": secondSlotTo,
      "third_slot_from": thirdSlotFrom,
      "consultancy_third_slot_duration": consultancyThirdSlotDuration,
      "third_slot_to": thirdSlotTo,
      "close": close
    };
    kLogger.e(body);
    try {
      Dio dio = Dio();
      PopupDialog.showLoadingDialog();
      var res = await dio.post(
          "https://cureways.webbysys.click/api/v1/time-slot-setup-store",
          data: body);
      kLogger.e(res.data);
      PopupDialog.closeLoadingDialog();
      PopupDialog.showSuccessDialog('The slot has been successfully created.');

      if (res.statusCode == 200) {
        getSlot();
      } else if (res.statusCode == 422) {
        PopupDialog.showErrorMessage('You have a required field.');
      }
    } catch (e) {
      PopupDialog.closeLoadingDialog();
      kLogger.e('Error from %%%% Create Slot %%%% => $e');
    }
  }

  updateSlot(
      {required int id,
      required String days,
      required String firstSlotFrom,
      required String firstSlotTo,
      required int consultancyFirstSlotDuration,
      required String secondSlotFrom,
      required String secondSlotTo,
      required int consultancySecondSlotDuration,
      required String thirdSlotFrom,
      required String thirdSlotTo,
      required int consultancyThirdSlotDuration,
      required String close}) async {
    var doctorID = _myBox.get('userId');
    loader = true;

    Map body = {
      "id": id,
      "doctor_id": doctorID,
      "days": days,
      "first_slot_from": firstSlotFrom,
      "first_slot_to": firstSlotTo,
      "consultancy_first_slot_duration": consultancyFirstSlotDuration,
      "second_slot_from": secondSlotFrom,
      "consultancy_second_slot_duration": consultancySecondSlotDuration,
      "second_slot_to": secondSlotTo,
      "third_slot_from": thirdSlotFrom,
      "consultancy_third_slot_duration": consultancyThirdSlotDuration,
      "third_slot_to": thirdSlotTo,
      "close": close
    };
    kLogger.e(body);
    try {
      Dio dio = Dio();
      PopupDialog.showLoadingDialog();
      var res = await dio.post(
          "https://cureways.webbysys.click/api/v1/time-slot-setup-update",
          data: body);
      kLogger.e(res.data);
      PopupDialog.closeLoadingDialog();
      PopupDialog.showSuccessDialog('The slot has been successfully updated.');

      if (res.statusCode == 200) {
        getSlot();
      } else if (res.statusCode == 422) {
        PopupDialog.showErrorMessage('You have a required field.');
      }
    } catch (e) {
      PopupDialog.closeLoadingDialog();
      kLogger.e('Error from %%%% Create Slot %%%% => $e');
    }
  }

  void onFilteredList(String key) {
    if (slotList.isNotEmpty) {
      slotFilteredList =
          slotList.where((element) => element.days == key).toList();
    }
  }

  getSlot() async {
    var doctorID = _myBox.get('userId');
    try {
      Dio dio = Dio();
      var res = await dio
          .get('https://cureways.webbysys.click/api/v1/time-slot-setup-show/$doctorID');
      slotList = (res.data['data'] as List)
          .map((item) => MainSlot.fromJson(item))
          .toList();
      update();
      kLogger.e(res.data);
    } catch (e) {
      kLogger.e('Error from %%%% GetSlot %%%% => $e');
    }
  }

  @override
  void onInit() {
    getSlot();
    super.onInit();
  }
}
