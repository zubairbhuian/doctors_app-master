import 'package:flutter/material.dart';

class Mixins {
  final List<Map<String, dynamic>> mainMenuItem = [
    {
      "title": "Today's\nSlots",
      "iconData": Icons.date_range_rounded
    },
    {
      "title": "Create\nSlot",
      "iconData": Icons.add_box
    },
  ];
  final List<Map<String, dynamic>> doctorAppointmentMainMenuItem = [
    {
      "title": "View\nAppointment",
      "images": "assets/home_screen/active_orders.png"
    },
    {
      "title": "Setup\nAppointment",
      "images": "assets/home_screen/pending_orders.png"
    },
    {
      "title": "Success\nAppointment",
      "images": "assets/home_screen/compleat_orders.png"
    },
  ];
  final List<Map<String, dynamic>> activeorderList = [
    {
      "title": "Order No 01",
      "description":
          "Order description/Body text........................................................................................",
    },
    {
      "title": "Order No 02",
      "description":
          "Order description/Body text........................................................................................",
    },
    {
      "title": "Order No 03",
      "description":
          "Order description/Body text........................................................................................",
    },
    {
      "title": "Order No 04",
      "description":
          "Order description/Body text........................................................................................",
    },
    {
      "title": "Order No 05",
      "description":
          "Order description/Body text........................................................................................",
    },
    {
      "title": "Order No 06",
      "description":
          "Order description/Body text........................................................................................",
    },
    {
      "title": "Order No 07",
      "description":
          "Order description/Body text........................................................................................",
    },
  ];
  final List<Map<String, dynamic>> completeorderList = [
    {
      "title": "Order No 01",
      "description":
          "Order description/Body text...............\n.........................................................................",
    },
    {
      "title": "Order No 02",
      "description":
          "Order description/Body text................\n....................................................................",
    },
    {
      "title": "Order No 03",
      "description":
          "Order description/Body text......................\n................................................................",
    },
    {
      "title": "Order No 04",
      "description":
          "Order description/Body text.....................\n................................................................",
    },
    {
      "title": "Order No 05",
      "description":
          "Order description/Body text......................\n...............................................................",
    },
    {
      "title": "Order No 06",
      "description":
          "Order description/Body text......................\n................................................................",
    },
    {
      "title": "Order No 07",
      "description":
          "Order description/Body text.....................\n................................................................",
    },
  ];
  final List<Map<String, dynamic>> viewappointmentList = [
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
    {
      "title": "Appointment Title",
      "description":
          "Appointment description/Body text.....................................",
      "date": "Jun 25 2023"
    },
  ];

  final List<String> doctorAppoinmentSlots = [
    '8 am - 9am',
    '9 am - 10 am',
    '10 am - 11 am',
    '11 am - 12 pm'
  ];
}
