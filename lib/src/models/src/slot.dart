// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class Slot {
  final int? index;
  final TimeOfDay? start;
  Slot({
    this.index,
    this.start,
  });

  Slot copyWith({
    int? index,
    TimeOfDay? start,
  }) {
    return Slot(
      index: index ?? this.index,
      start: start ?? this.start,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'start': start != null ? _timeOfDayToString(start!) : null,
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      index: map['index'] != null ? map['index'] as int : null,
      start: _stringToTimeOfDay(map['start'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) =>
      Slot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Slot(index: $index,  Slot(start: $start)';

  @override
  bool operator ==(covariant Object other) {
    if (identical(this, other)) return true;
    if (other is! Slot) return false;
    return other.index == index && other.start == start;
  }
  // bool operator ==(covariant Slot other) {
  //   if (identical(this, other)) return true;
  //   return other.index == index && other.start == start;
  // }

  @override
  int get hashCode => index.hashCode ^ start.hashCode;
}
