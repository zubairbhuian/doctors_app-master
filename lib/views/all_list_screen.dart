import 'package:doctors_app/controllers/all_slot_list_controller.dart';
import 'package:doctors_app/models/all_slot_list_model.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/views/update_slot.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
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
  final _myBox = Hive.box('doctorBox');

  @override
  Widget build(BuildContext context) {
    String userId = _myBox.get('userId');
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("My Slot"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                GetBuilder<AllSlotListController>(builder: (controller) {
                  List<AllSlotData> filteredSlotList = controller.allSlotList
                      .where((element) => element.date == widget.date)
                      .toList();

                  return ListView.builder(
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
                                userId: userId,
                                date: filteredSlotList[index].date ?? "",
                                from: filteredSlotList[index].slotFrom ?? "",
                                to: filteredSlotList[index].slotTo ?? ""));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Row(
                                    children: [
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
                                          : const Expanded(
                                              child: Text(
                                                "Unbooked",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                      IconButton(
                                          onPressed: () {
                                            AllSlotListController.to
                                                .onDeleteSlot(
                                                    filteredSlotList[index].id);

                                            // onUpdatefilteredSlotList();
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).marginOnly(bottom: 8);
                      }));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
