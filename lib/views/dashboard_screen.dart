import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/services/mixins.dart';
import 'package:doctors_app/views/today_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';

import 'all_slots_date_list_screen.dart';
import 'create_slot_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final dataMap = <String, double>{
    "Progress": 80.00,
  };
  final colorList = <Color>[
    Colors.white,
  ];

  final _myBox = Hive.box('doctorBox');

  @override
  Widget build(BuildContext context) {
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
                        "Hi, ${_myBox.get('userName')}!",
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DASHBOARD",
                  textAlign: TextAlign.start,
                  style: TextStyle(
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
                Container(
                  height: 120,
                  alignment: Alignment.topCenter,
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 105,
                      ),
                      itemCount: Mixins().mainMenuItem.length,
                      // scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            switch (Mixins()
                                .mainMenuItem
                                .elementAt(index)["title"]) {
                              case "Today's\nSlots":
                                Get.to(() => const TodayListScreen());
                                break;
                              case "Create\nSlot":
                                Get.to(() => const CreateSlotScreen());
                                break;
                              case "All\nSlots":
                                Get.to(() => const AllSlotsDateListScreen());
                                break;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ConstantsColor.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 80,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      "${Mixins().mainMenuItem.elementAt(index)["images"]}"),
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${Mixins().mainMenuItem.elementAt(index)["title"]}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
