import 'package:doctors_app/services/mixins.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/views/today_list_screen.dart';
import 'package:doctors_app/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // ******* Log Out
  onLogOut() async {
    // clean SharedPreferences data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // clean HoveBox  data
    var box = await Hive.openBox('doctorBox');
    await box.clear();

    // Route For Login
    Get.offAll(() => const WelcomescreenCheck());
  }

  final _myBox = Hive.box('doctorBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 152,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
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
                  color: kWhite,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 80,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Mixins().mainMenuItem.elementAt(index)["iconData"],color: kWhite,size: 33,),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
