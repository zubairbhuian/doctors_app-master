class MainSlot {
  int id;
  String doctorId;
  String days;
  String firstSlotFrom;
  String firstSlotTo;
  String consultancyFirstSlotDuration;
  String secondSlotFrom;
  String secondSlotTo;
  String consultancySecondSlotDuration;
  String thirdSlotFrom;
  String thirdSlotTo;
  String consultancyThirdSlotDuration;
  String close;
  DateTime createdAt;
  DateTime updatedAt;

  MainSlot({
    required this.id,
    required this.doctorId,
    required this.days,
    required this.firstSlotFrom,
    required this.firstSlotTo,
    required this.consultancyFirstSlotDuration,
    required this.secondSlotFrom,
    required this.secondSlotTo,
    required this.consultancySecondSlotDuration,
    required this.thirdSlotFrom,
    required this.thirdSlotTo,
    required this.consultancyThirdSlotDuration,
    required this.close,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MainSlot.fromJson(Map<String, dynamic> json) {
    return MainSlot(
      id: json['id'],
      doctorId: json['doctor_id'],
      days: json['days'],
      firstSlotFrom: json['first_slot_from'],
      firstSlotTo: json['first_slot_to'],
      consultancyFirstSlotDuration: json['consultancy_first_slot_duration'],
      secondSlotFrom: json['second_slot_from'],
      secondSlotTo: json['second_slot_to'],
      consultancySecondSlotDuration: json['consultancy_second_slot_duration'],
      thirdSlotFrom: json['third_slot_from'],
      thirdSlotTo: json['third_slot_to'],
      consultancyThirdSlotDuration: json['consultancy_third_slot_duration'],
      close: json['close'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}