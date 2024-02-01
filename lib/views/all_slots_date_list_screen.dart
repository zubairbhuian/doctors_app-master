import 'package:doctors_app/controllers/all_slot_list_controller.dart';
import 'package:doctors_app/controllers/slot_store_controller.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
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
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff082244),
                          borderRadius: BorderRadius.circular(10)),
                      height: 125,
                      width: double.maxFinite,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "OVERALL PROGRESS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "LAST 7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            PieChart(
                              dataMap: dataMap,
                              chartType: ChartType.ring,
                              chartRadius: 100,
                              ringStrokeWidth: 15,
                              initialAngleInDegree: 80,
                              centerText: "80%",
                              centerTextStyle: const TextStyle(
                                  backgroundColor: Color(0xff082244),
                                  fontSize: 18),
                              baseChartColor: const Color(0xff6D90C6),
                              colorList: colorList,
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                showChartValues: false,
                              ),
                              legendOptions:
                                  const LegendOptions(showLegends: false),
                              totalValue: 100,
                            ),
                          ],
                        ),
                      )),
                    ),
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
