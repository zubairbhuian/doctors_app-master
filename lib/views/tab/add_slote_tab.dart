import 'package:doctors_app/controllers/slot_store_controller.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/utils/my_func.dart';
import 'package:doctors_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSloteTab extends GetView<SlotStoreController> {
  final String day;
  const AddSloteTab(this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var firstSlotFrom = TextEditingController();
    var firstSlotTo = TextEditingController();
    var consultancyFirstSlotDuration = TextEditingController();
    var secondSlotFrom = TextEditingController();
    var secondSlotTo = TextEditingController();
    var consultancySecondSlotDuration = TextEditingController();
    var thirdSlotFrom = TextEditingController();
    var thirdSlotTo = TextEditingController();
    var consultancyThirdSlotDuration = TextEditingController();
    String? close;

    controller.onFilteredList(day);
    var data = controller.slotFilteredList;

    if (data.isNotEmpty) {
      firstSlotFrom = TextEditingController(text: data[0].firstSlotFrom);
      firstSlotTo = TextEditingController(text: data[0].firstSlotTo);
      consultancyFirstSlotDuration =
          TextEditingController(text: data[0].consultancyFirstSlotDuration);
      secondSlotFrom = TextEditingController(text: data[0].secondSlotFrom);
      secondSlotTo = TextEditingController(text: data[0].secondSlotTo);
      consultancySecondSlotDuration =
          TextEditingController(text: data[0].consultancySecondSlotDuration);
      thirdSlotFrom = TextEditingController(text: data[0].thirdSlotFrom);
      thirdSlotTo = TextEditingController(text: data[0].thirdSlotTo);
      consultancyThirdSlotDuration =
          TextEditingController(text: data[0].consultancyThirdSlotDuration);
      close = data[0].close;
      // controller.update();
      // kLogger.e(data[0].days);
    }
    kLogger.e(data.length);

    return GetBuilder<SlotStoreController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "First Slot",
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    /// !  1
                    CustomTextField2(
                      controller: firstSlotFrom,
                      readOnly: true,
                      hintText: "First Slot From",
                      suffixIcon: const Icon(Icons.timer),
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          //! formet the time
                          firstSlotFrom.text =
                              MyFunc.formatTimeOfDay(selectedTime);
                          // storeBodyTmp.update();
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Slot From';
                        }
                        return null;
                      },
                    ),
                    CustomTextField2(
                      controller: firstSlotTo,
                      readOnly: true,
                      hintText: "First Slot To",
                      suffixIcon: const Icon(Icons.timer),
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          //! formet the time
                          firstSlotTo.text =
                              MyFunc.formatTimeOfDay(selectedTime);
                          // storeBodyTmp.update();
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Slot To';
                        }
                        return null;
                      },
                    ),
                    CustomTextField2(
                      controller: consultancyFirstSlotDuration,
                      hintText: 'Consultancy First Slot Duration',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Slot Duration';
                        }
                        return null;
                      },
                    ),

                    /// !  2
                    const Text(
                      "Second Slot (Optional)",
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField2(
                      controller: secondSlotFrom,
                      readOnly: true,
                      hintText: "Second Slot From",
                      suffixIcon: const Icon(Icons.timer),
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          //! formet the time
                          secondSlotFrom.text =
                              MyFunc.formatTimeOfDay(selectedTime);
                          // storeBodyTmp.update();
                        }
                      },
                    ),
                    CustomTextField2(
                      controller: secondSlotTo,
                      readOnly: true,
                      hintText: "Second Slot To",
                      suffixIcon: const Icon(Icons.timer),
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          //! formet the time
                          secondSlotTo.text =
                              MyFunc.formatTimeOfDay(selectedTime);
                          // storeBodyTmp.update();
                        }
                      },
                    ),
                    CustomTextField2(
                      controller: consultancySecondSlotDuration,
                      hintText: 'Consultancy Second Slot Duration',
                      keyboardType: TextInputType.number,
                    ),

                    /// !  3
                    const Text(
                      "Third Slot (Optional)",
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField2(
                      controller: thirdSlotFrom,
                      readOnly: true,
                      hintText: "Third Slot From",
                      suffixIcon: const Icon(Icons.timer),
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          //! formet the time
                          thirdSlotFrom.text =
                              MyFunc.formatTimeOfDay(selectedTime);
                          // storeBodyTmp.update();
                        }
                      },
                    ),
                    CustomTextField2(
                      controller: thirdSlotTo,
                      readOnly: true,
                      hintText: "Third Slot To",
                      suffixIcon: const Icon(Icons.timer),
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          //! formet the time
                          thirdSlotTo.text =
                              MyFunc.formatTimeOfDay(selectedTime);
                          // storeBodyTmp.update();
                        }
                      },
                    ),
                    CustomTextField2(
                      controller: consultancyThirdSlotDuration,
                      hintText: 'Consultancy Third Slot Duration',
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Slot Status  (Optional)",
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomDropdownTextFiel(
                        hint: const Text('Select your slot status'),
                        value: close,
                        data: controller.closeList,
                        onChanged: (value) {
                          close = value;
                          // controller.update();
                        })
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
                    if (_formKey.currentState!.validate()) {
                      if (data.isEmpty) {
                        // create slot
                        controller.createSlot(
                            days: day,
                            firstSlotFrom: firstSlotFrom.text,
                            firstSlotTo: firstSlotTo.text,
                            consultancyFirstSlotDuration:
                                consultancyFirstSlotDuration.text.isNotEmpty
                                    ? int.parse(
                                        consultancyFirstSlotDuration.text)
                                    : 0,
                            secondSlotFrom: secondSlotFrom.text,
                            secondSlotTo: secondSlotTo.text,
                            consultancySecondSlotDuration:
                                consultancySecondSlotDuration.text.isNotEmpty
                                    ? int.parse(
                                        consultancySecondSlotDuration.text)
                                    : 0,
                            thirdSlotFrom: thirdSlotFrom.text,
                            thirdSlotTo: thirdSlotTo.text,
                            consultancyThirdSlotDuration:
                                consultancyThirdSlotDuration.text.isNotEmpty
                                    ? int.parse(
                                        consultancyThirdSlotDuration.text)
                                    : 0,
                            close: close ?? "yes");
                      } else {
                        // update slot
                        controller.updateSlot(
                            id: data[0].id,
                            days: day,
                            firstSlotFrom: firstSlotFrom.text,
                            firstSlotTo: firstSlotTo.text,
                            consultancyFirstSlotDuration:
                                consultancyFirstSlotDuration.text.isNotEmpty
                                    ? int.parse(
                                        consultancyFirstSlotDuration.text)
                                    : 0,
                            secondSlotFrom: secondSlotFrom.text,
                            secondSlotTo: secondSlotTo.text,
                            consultancySecondSlotDuration:
                                consultancySecondSlotDuration.text.isNotEmpty
                                    ? int.parse(
                                        consultancySecondSlotDuration.text)
                                    : 0,
                            thirdSlotFrom: thirdSlotFrom.text,
                            thirdSlotTo: thirdSlotTo.text,
                            consultancyThirdSlotDuration:
                                consultancyThirdSlotDuration.text.isNotEmpty
                                    ? int.parse(
                                        consultancyThirdSlotDuration.text)
                                    : 0,
                            close: close ?? "yes");
                      }
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: ConstantsColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    data.isEmpty ? 'CREATE SLOT' : 'UPDATE SLOT',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    });
  }
}
