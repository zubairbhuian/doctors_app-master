class LoginResponseModel {
  LoginResponseModel({
    this.status,
    this.message,
    this.data,
    this.todaySlots,
    this.allSlots,
    this.token,
  });

  LoginResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DoctorData.fromJson(json['data']) : null;
    if (json['todaySlots'] != null) {
      todaySlots = [];
      json['todaySlots'].forEach((v) {
        todaySlots?.add(TodaySlots.fromJson(v));
      });
    }
    if (json['allSlots'] != null) {
      allSlots = [];
      json['allSlots'].forEach((v) {
        allSlots?.add(AllSlots.fromJson(v));
      });
    }
    token = json['token'];
  }
  int? status;
  String? message;
  DoctorData? data;
  List<TodaySlots>? todaySlots;
  List<AllSlots>? allSlots;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (todaySlots != null) {
      map['todaySlots'] = todaySlots?.map((v) => v.toJson()).toList();
    }
    if (allSlots != null) {
      map['allSlots'] = allSlots?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }
}

class AllSlots {
  AllSlots({
    this.id,
    this.date,
    this.slotFrom,
    this.slotTo,
    this.status,
  });

  AllSlots.fromJson(dynamic json) {
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

class TodaySlots {
  TodaySlots({
    this.id,
    this.date,
    this.slotFrom,
    this.slotTo,
    this.status,
  });

  TodaySlots.fromJson(dynamic json) {
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

class DoctorData {
  DoctorData({
    this.id,
    this.doctorId,
    this.name,
    this.email,
    this.serviceType,
    this.divisionId,
    this.policeStationId,
    this.areaId,
  });

  DoctorData.fromJson(dynamic json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    name = json['name'];
    email = json['email'];
    serviceType = json['service_type'];
    divisionId = json['division_id'];
    policeStationId = json['police_station_id'];
    areaId = json['area_id'];
  }
  int? id;
  int? doctorId;
  String? name;
  String? email;
  dynamic serviceType;
  dynamic divisionId;
  dynamic policeStationId;
  dynamic areaId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doctor_id'] = doctorId;
    map['name'] = name;
    map['email'] = email;
    map['service_type'] = serviceType;
    map['division_id'] = divisionId;
    map['police_station_id'] = policeStationId;
    map['area_id'] = areaId;
    return map;
  }
}
