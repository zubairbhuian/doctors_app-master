import 'dart:convert';

import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/services/constants/endpoints.dart';
import 'package:doctors_app/services/server.dart';
import 'package:doctors_app/services/user_service.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateSlot extends StatefulWidget {
  final int id;
  final String userId;
  final String date;
  final String from;
  final String to;
  const UpdateSlot({
    super.key,
    required this.date,
    required this.from,
    required this.to,
    required this.id,
    required this.userId,
  });

  @override
  State<UpdateSlot> createState() => _UpdateSlotState();
}

class _UpdateSlotState extends State<UpdateSlot> {
  UserService userService = UserService();
  Server server = Server();
  late TextEditingController referredDate =
      TextEditingController(text: widget.date);
  late TextEditingController slotFromTime =
      TextEditingController(text: widget.from);
  late TextEditingController slotToTime =
      TextEditingController(text: widget.to);
  bool loader = false;

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

  // ! ====== API calling  ======
  void updateSlot() {
    try {
      loader = true;
      Map body = {
        'id': widget.id,
        'doctor_id': widget.userId,
        'date': widget.date,
        'slot_from': widget.from,
        'slot_to': widget.to
      };
      kLogger.i(body);
      String jsonBody = json.encode(body);
      server
          .postRequestWithToken(endPoint: Endpoints.slotUpdate, body: jsonBody)
          .then((response) {
        kLogger.i(json.decode(response.body));
        if (response != null && response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          kLogger.i(jsonResponse);
          loader = false;
          setState(() {
            
          });

          Get.rawSnackbar(
              message: 'Successful!', backgroundColor: Colors.green);
        } else {
          loader = false;
          Get.rawSnackbar(
              message: 'Please enter valid Input', backgroundColor: Colors.red);
        }
      });
    } catch (e) {
      loader = false;
      kLogger.e(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Update Slot"),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 22),
        child: Column(
          children: [
            const Text(
              "REFERRED DATE ",
              style: TextStyle(
                  color: kPrimaryColor,
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
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "TIME SLOTS ",
                    style: TextStyle(
                        color: kPrimaryColor,
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
                        color: kPrimaryColor,
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
                        color: kPrimaryColor,
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
                  setState(() {
                    updateSlot();
                  });
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: loader == true
                    ? const CircularProgressIndicator(
                        color: kWhite,
                      )
                    : Text(
                        'update SLOT'.toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
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
  }
}
