import 'package:doctors_app/controllers/slot_store_controller.dart';
import 'package:doctors_app/controllers/today_slot_list_controller.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class TodayListScreen extends StatefulWidget {
  const TodayListScreen({super.key});

  @override
  State<TodayListScreen> createState() => _TodayListScreenState();
}

class _TodayListScreenState extends State<TodayListScreen> {
  final dataMap = <String, double>{
    "Progress": 80.00,
  };
  final colorList = <Color>[
    Colors.white,
  ];

  TodaySlotListController todaySlotListController = TodaySlotListController();
  SlotStoreController storeController = SlotStoreController();

  @override
  void didChangeDependencies() {
    todaySlotListController = Get.put(TodaySlotListController());
    todaySlotListController.getTodaySlotList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodaySlotListController>(
      init: TodaySlotListController(),
      builder: (todaySlot) => Scaffold(
      
      appBar: const CustomAppBar(title: Text("Today's Slots"),),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  todaySlot.loader == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: todaySlot.todaySlotList.length,
                          itemBuilder: ((context, int index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Slot time:  ${todaySlot.todaySlotList[index].slotFrom} - ${todaySlot.todaySlotList[index].slotTo}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    todaySlot.todaySlotList[index].status == "5"
                                        ? const Text(
                                            "Booked",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.green,
                                            ),
                                          )
                                        : const Text(
                                            "Unbooked",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
