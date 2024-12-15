// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

const uuid = Uuid();
List<Schedule> get defaultSchedules => [
      Schedule(day: Weekday.monday, id: uuid.v4()),
      Schedule(day: Weekday.tuesday, id: uuid.v4()),
      Schedule(day: Weekday.wednesday, id: uuid.v4()),
      Schedule(day: Weekday.thursday, id: uuid.v4()),
      Schedule(day: Weekday.friday, id: uuid.v4()),
      Schedule(day: Weekday.saturday, id: uuid.v4()),
      Schedule(day: Weekday.sunday, id: uuid.v4()),
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
  final int? firstVisitFee;
  final int? followupFee;

  const Chember(
      {this.id,
      this.name,
      this.address,
      this.roomNo,
      this.chemberEmail,
      this.phone,
      this.floor,
      this.lat,
      this.long,
      this.schedules,
      this.firstVisitFee,
      this.followupFee});

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
    int? firstVisitFee,
    int? followupFee,
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
        firstVisitFee: firstVisitFee ?? this.firstVisitFee,
        followupFee: followupFee ?? this.followupFee);
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
      'firstVisitFee': firstVisitFee,
      'followupFee': followupFee
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
        firstVisitFee:
            map['firstVisitFee'] != null ? map['firstVisitFee'] as int : null,
        followupFee:
            map['followupFee'] != null ? map['followupFee'] as int : null);
  }

  String toJson() => json.encode(toMap());

  factory Chember.fromJson(String source) =>
      Chember.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chember(name: $name, address: $address, roomNo: $roomNo, chemberEmail: $chemberEmail, phone: $phone, floor: $floor, lat: $lat, long: $long, schedules: $schedules, firstVisitFee: $firstVisitFee, followupFee: $followupFee)';
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
        other.firstVisitFee == firstVisitFee &&
        other.followupFee == followupFee &&
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
        firstVisitFee.hashCode ^
        followupFee.hashCode ^
        schedules.hashCode;
  }
}
