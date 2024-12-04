// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

final defaultSchedules = [
  Schedule(day: Weekday.monday),
  Schedule(day: Weekday.tuesday),
  Schedule(day: Weekday.wednesday),
  Schedule(day: Weekday.thursday),
  Schedule(day: Weekday.friday),
  Schedule(day: Weekday.saturday),
  Schedule(day: Weekday.sunday),
];

class Chember {
  final String? id;
  final String? name;
  final String? address;
  final String? roomNo;
  final String? chemberEmail;
  final String? phone;
  final String? floor;

  final double? lat;
  final double? long;
  final List<Schedule>? schedules;

  const Chember({
    this.id,
    this.name,
    this.address,
    this.roomNo,
    this.chemberEmail,
    this.phone,
    this.floor,
    this.lat,
    this.long,
    this.schedules,
  });

  Chember copyWith({
    String? id,
    String? name,
    String? address,
    String? roomNo,
    String? chemberEmail,
    String? phone,
    String? floor,
    String? web,
    double? lat,
    double? long,
    List<Schedule>? schedules,
  }) {
    return Chember(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      roomNo: roomNo ?? this.roomNo,
      chemberEmail: chemberEmail ?? this.chemberEmail,
      phone: phone ?? this.phone,
      floor: floor ?? this.floor,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      schedules: schedules ?? this.schedules,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'roomNo': roomNo,
      'chemberEmail': chemberEmail,
      'phone': phone,
      'floor': floor,
      'lat': lat,
      'long': long,
      'schedules': schedules?.map((x) => x.toMap()).toList(),
    };
  }

  factory Chember.fromMap(Map<String, dynamic> map) {
    return Chember(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      roomNo: map['roomNo'] != null ? map['roomNo'] as String : null,
      chemberEmail:
          map['chemberEmail'] != null ? map['chemberEmail'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      // phone: map['phone'] != null
      //     ? List<String>.from((map['phone'] as List<String>))
      //     : null,
      floor: map['floor'] != null ? map['floor'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      long: map['long'] != null ? map['long'] as double : null,
      schedules: map['schedules'] != null
          ? (map['schedules'] as List)
              .map((scheduleData) => Schedule.fromMap(scheduleData))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chember.fromJson(String source) =>
      Chember.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chember(name: $name, address: $address, roomNo: $roomNo, chemberEmail: $chemberEmail, phone: $phone, floor: $floor, lat: $lat, long: $long, schedules: $schedules)';
  }

  @override
  bool operator ==(covariant Chember other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.address == address &&
        other.roomNo == roomNo &&
        other.chemberEmail == chemberEmail &&
        other.phone == phone &&
        // listEquals(other.phone, phone) &&
        other.floor == floor &&
        other.lat == lat &&
        other.long == long &&
        listEquals(other.schedules, schedules);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        address.hashCode ^
        roomNo.hashCode ^
        chemberEmail.hashCode ^
        phone.hashCode ^
        floor.hashCode ^
        lat.hashCode ^
        long.hashCode ^
        schedules.hashCode;
  }
}
