import 'package:dio/dio.dart';
import 'package:doctors_app/models/today_slot_list_model.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/utils/const_color.dart';
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

    try {
      Dio dio = Dio();
      loader = true;
      update();
      var res = await dio.get(
          'https://cureways.webbysys.click/api/v1/time-slot-view-today/$doctorID');
      loader = false;
      update();
      if (res.statusCode == 200) {
        if (res.data['data'] != null && res.data['data'].isNotEmpty) {
          todaySlotList = (res.data['data'] as List)
              .map((item) => TodaySlotData.fromJson(item))
              .toList();
          kLogger.e(todaySlotList.length);
        }
      }
    } catch (e) {
      loader = false;
      update();
      kLogger.e('Error from %%%% Today slot %%%% => $e');
    }
  }
}
