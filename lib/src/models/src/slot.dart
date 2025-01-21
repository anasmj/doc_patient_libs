// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class Slot {
  final String? id;
  final int? serial;
  final TimeOfDay? start;
  Slot({
    this.id,
    this.serial,
    this.start,
  });

  Slot copyWith({
    String? id,
    int? serial,
    TimeOfDay? start,
  }) {
    return Slot(
      id: id ?? this.id,
      serial: serial ?? this.serial,
      start: start ?? this.start,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'serial': serial,
      'start': start != null ? _timeOfDayToString(start!) : null,
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      id: map['id'] != null ? map['id'] as String : null,
      serial: map['serial'] != null ? map['serial'] as int : null,
      start: _stringToTimeOfDay(map['start'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) =>
      Slot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'id: $id,serial: $serial ,  Slot(start: $start)';

  @override
  bool operator ==(covariant Slot other) {
    if (identical(this, other)) return true;
    return other.id == id && other.serial == serial && other.start == start;
  }

  @override
  int get hashCode => id.hashCode ^ serial.hashCode ^ start.hashCode;
}
