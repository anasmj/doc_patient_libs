// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class Timing {
  final String? id;
  final TimeOfDay? start;
  final TimeOfDay? end;
  Timing({
    this.id,
    this.start,
    this.end,
  });

  Timing copyWith({
    String? id,
    TimeOfDay? start,
    TimeOfDay? end,
  }) {
    return Timing(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start': start != null ? _timeOfDayToString(start!) : null,
      'end': start != null ? _timeOfDayToString(end!) : null,
    };
  }

  factory Timing.fromMap(Map<String, dynamic> map) {
    return Timing(
      id: map['id'] != null ? map['id'] as String : null,
      start: _stringToTimeOfDay(map['start'] as String),
      end: _stringToTimeOfDay(map['end'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Timing.fromJson(String source) =>
      Timing.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'id: $id, Timing(start: $start, end: $end)';

  @override
  bool operator ==(covariant Timing other) {
    if (identical(this, other)) return true;
    return other.id == id && other.start == start && other.end == end;
  }

  @override
  int get hashCode => id.hashCode ^ start.hashCode ^ end.hashCode;
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
