class AllSlotListModel {
  AllSlotListModel({
    this.data,
    this.message,
    this.status,
  });

  AllSlotListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AllSlotData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<AllSlotData>? data;
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

class AllSlotData {
  AllSlotData({
    this.id,
    this.date,
    this.slotFrom,
    this.slotTo,
    this.status,
  });

  AllSlotData.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    slotFrom = json['slot_from'];
    slotTo = json['slot_to'];
    status = json['status'];
  }
  int? id;
  String? date;
  String? slotFrom;
  String? slotTo;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['slot_from'] = slotFrom;
    map['slot_to'] = slotTo;
    map['status'] = status;
    return map;
  }
}
