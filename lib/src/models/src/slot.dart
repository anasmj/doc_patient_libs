// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class Slot {
  ///iekif3-erjikj-kjrkej-ilkdf_1
  ///scheduleId_index
  final String? timingId;
  final int? index;
  final TimeOfDay? start;
  Slot({this.timingId, this.index, this.start});

  Slot copyWith({
    String? timingId,
    int? index,
    TimeOfDay? start,
  }) {
    return Slot(
      timingId: timingId ?? this.timingId,
      index: index ?? this.index,
      start: start ?? this.start,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timingId': timingId,
      'index': index,
      'start': start != null ? _timeOfDayToString(start!) : null,
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      timingId: map['timingId'] != null ? map['timingId'] as String : null,
      index: map['index'] != null ? map['index'] as int : null,
      start: _stringToTimeOfDay(map['start'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) =>
      Slot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Slot(timingId: $timingId, index: $index,  Slot(start: $start)';

  @override
  bool operator ==(covariant Slot other) {
    if (identical(this, other)) return true;
    return other.timingId == timingId &&
        other.index == index &&
        other.start == start;
  }

  @override
  int get hashCode => timingId.hashCode ^ index.hashCode ^ start.hashCode;
}
