class TodaySlotListModel {
  TodaySlotListModel({
    this.data,
    this.message,
    this.status,
  });

  TodaySlotListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TodaySlotData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<TodaySlotData>? data;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class TodaySlotData {
  final int id;
  final String? date;
  final String? slotFrom;
  final String? slotTo;
  final String? status;
  final String? consultancyDuration;
  final String? scheduleTime;

  TodaySlotData({
    required this.id,
    this.date,
    this.slotFrom,
    this.slotTo,
    this.status,
    this.consultancyDuration,
    this.scheduleTime,
  });

  factory TodaySlotData.fromJson(Map<String, dynamic> json) {
    return TodaySlotData(
      id: json['id'],
      date: json['date'],
      slotFrom: json['slot_from'],
      slotTo: json['slot_to'],
      status: json['status'],
      consultancyDuration: json['consultancy_duration'],
      scheduleTime: json['schedule_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['slot_from'] = slotFrom;
    data['slot_to'] = slotTo;
    data['status'] = status;
    data['consultancy_duration'] = consultancyDuration;
    data['schedule_time'] = scheduleTime;
    return data;
  }
}

