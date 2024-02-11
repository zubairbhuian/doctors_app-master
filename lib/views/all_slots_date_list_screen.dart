import 'package:doctors_app/controllers/all_slot_list_controller.dart';
import 'package:doctors_app/controllers/slot_store_controller.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import 'all_list_screen.dart';

class AllSlotsDateListScreen extends StatefulWidget {
  const AllSlotsDateListScreen({super.key});

  @override
  State<AllSlotsDateListScreen> createState() => _AllSlotsDateListScreenState();
}

class _AllSlotsDateListScreenState extends State<AllSlotsDateListScreen> {
  final dataMap = <String, double>{
    "Progress": 80.00,
  };
  final colorList = <Color>[
    Colors.white,
  ];

  AllSlotListController allSlotListController = AllSlotListController();
  SlotStoreController storeController = SlotStoreController();

  @override
  void didChangeDependencies() {
    allSlotListController = Get.put(AllSlotListController());
    allSlotListController.getAllSlotList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllSlotListController>(
      init: AllSlotListController(),
      builder: (allSlot) {
        List<dynamic> dates =
            allSlot.allSlotList.map((slot) => slot.date).toList();
        Set<dynamic> uniqueDatesSet = dates.toSet();
        List<dynamic> uniqueDatesList = uniqueDatesSet.toList();
        uniqueDatesList.sort((a, b) => b.compareTo(a));
        return Scaffold(
           appBar: const CustomAppBar(title: Text("All Slots Dates"),),
          body: SingleChildScrollView(
            child: Container(
              color: ConstantsColor.backgroundColor,
              child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    allSlot.loader == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: uniqueDatesList.length,
                            itemBuilder: ((context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => AllListScreen(
                                      date: uniqueDatesList[index],
                                      allSlotData: allSlot.allSlotList));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          uniqueDatesList[index].toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
