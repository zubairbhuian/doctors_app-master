import 'package:doctors_app/controllers/slot_store_controller.dart';
import 'package:doctors_app/controllers/today_slot_list_controller.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateSlotScreen extends StatefulWidget {
  const CreateSlotScreen({super.key});

  @override
  State<CreateSlotScreen> createState() => _CreateSlotScreenState();
}

class _CreateSlotScreenState extends State<CreateSlotScreen> {
  final dataMap = <String, double>{
    "Progress": 80.00,
  };
  final colorList = <Color>[
    Colors.white,
  ];

  final TextEditingController referredDate = TextEditingController();
  final TextEditingController slotFromTime = TextEditingController();
  final TextEditingController slotToTime = TextEditingController();
  SlotStoreController storeController = SlotStoreController();
  TodaySlotListController todaySlotListController = TodaySlotListController();

  @override
  void didChangeDependencies() {
    storeController = Get.put(SlotStoreController());
    todaySlotListController = Get.put(TodaySlotListController());
    todaySlotListController.getTodaySlotList();
    super.didChangeDependencies();
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() => referredDate.text = formattedDate.toString());
    }
  }

  Future _selectSlotFromTime() async {
    TimeOfDay? pickedSlotFrom = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedSlotFrom != null) {
      String formattedTime = _formatTime(pickedSlotFrom);
      setState(() => slotFromTime.text = formattedTime);
    }
  }

  Future _selectSlotToTime() async {
    TimeOfDay? pickedSlotFrom = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedSlotFrom != null) {
      String formattedTime = _formatTime(pickedSlotFrom);
      setState(() => slotToTime.text = formattedTime);
    }
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final selectedTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.jm().format(selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlotStoreController>(
      init: SlotStoreController(),
      builder: (storeSlot) => Scaffold(
        appBar: const CustomAppBar(
          title: Text("Create Slot"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "REFERRED DATE ",
                  style: TextStyle(
                      color: ConstantsColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: referredDate,
                        onTap: () {
                          _selectDate();
                        },
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: '   Referred Date',
                          hintText: '   Referred Date',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.normal),
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: ConstantsColor.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "TIME SLOTS ",
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: slotFromTime,
                        onTap: () {
                          _selectSlotFromTime();
                        },
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: '   Select Slot From',
                          hintText: '   Select Slot From',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.normal),
                          suffixIcon: Icon(
                            Icons.timer,
                            color: ConstantsColor.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: slotToTime,
                        onTap: () {
                          _selectSlotToTime();
                        },
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: '   Select Slot To',
                          hintText: '   Select Slot To',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.normal),
                          suffixIcon: Icon(
                            Icons.timer,
                            color: ConstantsColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: () {
                      storeSlot.storeSlotOnTap(
                        context,
                        referredDate.text.toString().trim(),
                        slotFromTime.text.toString().trim(),
                        slotToTime.text.toString().trim(),
                        "10",
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: ConstantsColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: storeSlot.loader == true
                        ? const CircularProgressIndicator(
                            color: ConstantsColor.backgroundColor,
                          )
                        : const Text(
                            'CREATE SLOT',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<TodaySlotListController>(
                  init: TodaySlotListController(),
                  builder: (todaySlot) => todaySlot.loader == true
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
