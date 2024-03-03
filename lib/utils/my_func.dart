import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyFunc{
  static   String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formatter = DateFormat('h:mm a'); // 'a' includes AM/PM notation
    return formatter.format(dateTime);
  }
}