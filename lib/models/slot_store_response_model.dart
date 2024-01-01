class SlotStoreResponseModel {
  SlotStoreResponseModel({
    this.data,
    this.message,
    this.status,
  });

  SlotStoreResponseModel.fromJson(dynamic json) {
    data = json['data'] != null ? SlotStoreData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
  SlotStoreData? data;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class SlotStoreData {
  SlotStoreData({
    this.doctorId,
    this.date,
    this.slotFrom,
    this.slotTo,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  SlotStoreData.fromJson(dynamic json) {
    doctorId = json['doctor_id'];
    date = json['date'];
    slotFrom = json['slot_from'];
    slotTo = json['slot_to'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? doctorId;
  String? date;
  String? slotFrom;
  String? slotTo;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctor_id'] = doctorId;
    map['date'] = date;
    map['slot_from'] = slotFrom;
    map['slot_to'] = slotTo;
    map['status'] = status;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }
}
