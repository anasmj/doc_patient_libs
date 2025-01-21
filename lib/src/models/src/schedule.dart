part of '../models.dart';

class Schedule {
  final String? id;
  final Weekday day;
  final List<Timing>? timings;

  Schedule({
    this.id,
    required this.day,
    this.timings,
  });
  addTiming(Timing t) => timings?.add(t);
  removeTiming(Timing t) => timings?.remove(t);

  updateTiming(Timing prev, Timing newT) {
    timings?.remove(prev);
    timings?.add(newT);
  }

  Schedule copyWith({
    String? id,
    Weekday? day,
    List<Timing>? timings,
  }) {
    return Schedule(
      id: id ?? this.id,
      day: day ?? this.day,
      timings: timings ?? this.timings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day.toString(),
      'timings': timings?.map((x) => x.toMap()).toList(),
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'] != null ? map['id'] as String : null,
      day: Weekday.fromString(map['day'] as String)!,
      timings: map['timings'] != null
          ? (map['timings'] as List)
              .map((timingData) => Timing.fromMap(timingData))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Schedule(day: $day, timings: $timings)';

  @override
  bool operator ==(covariant Schedule other) {
    if (other.runtimeType != runtimeType) return false;
    if (identical(this, other)) return true;

    return other.id == id &&
        other.day == day &&
        listEquals(other.timings, timings);
  }

  @override
  int get hashCode => id.hashCode ^ day.hashCode ^ timings.hashCode;
}
