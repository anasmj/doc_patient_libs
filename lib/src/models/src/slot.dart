// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class Slot {
  String? id;
  final TimeOfDay start;
  final TimeOfDay end;
  Slot({
    required this.id,
    required this.start,
    required this.end,
  });

  Slot copyWith({
    String? id,
    TimeOfDay? start,
    TimeOfDay? end,
  }) {
    return Slot(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start': _timeOfDayToString(start),
      'end': _timeOfDayToString(end),
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      id: map['id'] as String,
      start: _stringToTimeOfDay(map['start'] as String),
      end: _stringToTimeOfDay(map['end'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) =>
      Slot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'id: $id, Slot(start: $start, end: $end)';

  @override
  bool operator ==(covariant Slot other) {
    if (identical(this, other)) return true;

    return other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

String _timeOfDayToString(TimeOfDay time) {
  final hours = time.hour.toString().padLeft(2, '0');
  final minutes = time.minute.toString().padLeft(2, '0');
  return "$hours:$minutes";
}

TimeOfDay _stringToTimeOfDay(String timeString) {
  final parts = timeString.split(':');
  final hours = int.parse(parts[0]);
  final minutes = int.parse(parts[1]);
  return TimeOfDay(hour: hours, minute: minutes);
}
