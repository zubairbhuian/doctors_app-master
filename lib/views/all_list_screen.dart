import 'package:doctors_app/models/all_slot_list_model.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/views/update_slot.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';

class AllListScreen extends StatefulWidget {
  final String? date;
  final List<AllSlotData> allSlotData;
  const AllListScreen({super.key, this.date, required this.allSlotData});

  @override
  State<AllListScreen> createState() => _AllListScreenState();
}

class _AllListScreenState extends State<AllListScreen> {
  final dataMap = <String, double>{
    "Progress": 80.00,
  };
  final colorList = <Color>[
    Colors.white,
  ];

  // AllSlotListController allSlotListController = AllSlotListController();
  //
  // @override
  // void didChangeDependencies() {
  //   allSlotListController = Get.put(AllSlotListController());
  //   allSlotListController.getAllSlotList();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    List<AllSlotData> filteredSlotList = widget.allSlotData
        .where((element) => element.date == widget.date)
        .toList();
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("My Slot"),
      ),
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
                              backgroundColor: Color(0xff082244), fontSize: 18),
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
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredSlotList.length,
                    itemBuilder: ((context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => UpdateSlot(
                              id: filteredSlotList[index].id ?? 0,
                              date: filteredSlotList[index].date ?? "",
                              from: filteredSlotList[index].slotFrom ?? "",
                              to: filteredSlotList[index].slotTo ?? ""));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Slot time:  ${filteredSlotList[index].slotFrom} - ${filteredSlotList[index].slotTo}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                filteredSlotList[index].status == "5"
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
                        ),
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
