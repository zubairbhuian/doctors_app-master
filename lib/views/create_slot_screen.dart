import 'package:doctors_app/controllers/slot_store_controller.dart';
import 'package:doctors_app/controllers/today_slot_list_controller.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/views/tab/add_slote_tab.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final TextEditingController consultancyDuration = TextEditingController();
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

  Future _setconsultancyDuration() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() => consultancyDuration.text = formattedDate.toString());
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
      builder: (storeSlot) => DefaultTabController(
        length: storeController.daysOfWeek.length,
        child: Scaffold(
            appBar: CustomAppBar(
              preferredHeight: 80,
              title: const Text("Create Slot"),
              bottom: TabBar(
                controller: storeController.tabController,
                isScrollable: true,
                labelColor: kWhite,
                unselectedLabelColor: kWhite,
                dividerColor: kWhite,
                indicatorColor: kWhite,
                padding: const EdgeInsets.symmetric(vertical: 6),
                tabs: List.generate(storeController.daysOfWeek.length, (index) {
                  return Text(storeController.daysOfWeek[index]);
                }),
              ),
            ),
            body: TabBarView(
                controller: storeController.tabController,
                children:
                    List.generate(storeController.daysOfWeek.length, (index) {
                  return  AddSloteTab(storeController.daysOfWeek[index]);
                }))),
      ),
    );
  }
}







        
        