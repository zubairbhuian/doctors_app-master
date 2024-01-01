import 'package:doctors_app/models/all_slot_list_model.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  final _myBox = Hive.box('doctorBox');

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
    List<dynamic> filteredSlotList = widget.allSlotData
        .where((element) => element.date == widget.date)
        .toList();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 152,
        automaticallyImplyLeading: false,
        backgroundColor: ConstantsColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, ${_myBox.get('name')}!",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const Text(
                        "Welcome back",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "assets/home_screen/bell.svg",
                  height: 32,
                  width: 32,
                  theme: const SvgTheme(currentColor: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Slots on ${widget.date}",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ConstantsColor.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
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
                      return Card(
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
