class SocialLoginResponseModel {
  SocialLoginResponseModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  SocialLoginResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SocialLoginData.fromJson(json['data']) : null;
    token = json['token'];
  }
  int? status;
  String? message;
  SocialLoginData? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class SocialLoginData {
  SocialLoginData({
    this.id,
    this.name,
    this.email,
    this.serviceType,
    this.divisionId,
    this.policeStationId,
    this.areaId,
  });

  SocialLoginData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    serviceType = json['service_type'];
    divisionId = json['division_id'];
    policeStationId = json['police_station_id'];
    areaId = json['area_id'];
  }
  int? id;
  String? name;
  String? email;
  dynamic serviceType;
  dynamic divisionId;
  dynamic policeStationId;
  dynamic areaId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['service_type'] = serviceType;
    map['division_id'] = divisionId;
    map['police_station_id'] = policeStationId;
    map['area_id'] = areaId;
    return map;
  }
}
