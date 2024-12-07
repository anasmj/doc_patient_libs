part of '../models.dart';

class Schedule {
  final Weekday day;
  final List<Slot>? slots;

  Schedule({
    required this.day,
    this.slots,
  });
  addSlot(Slot slot) => slots?.add(slot);
  removeSlot(Slot slot) => slots?.remove(slot);

  updateSlot(Slot prev, Slot newSlot) {
    slots?.remove(prev);
    slots?.add(newSlot);
  }

  Schedule copyWith({
    Weekday? day,
    List<Slot>? slots,
  }) {
    return Schedule(
      day: day ?? this.day,
      slots: slots ?? this.slots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day.toString(),
      'slots': slots?.map((x) => x.toMap()).toList(),
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      day: Weekday.fromString(map['day'] as String)!,
      slots: map['slots'] != null
          ? (map['slots'] as List)
              .map((slotData) => Slot.fromMap(slotData))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Schedule(day: $day, slots: $slots)';

  @override
  bool operator ==(covariant Schedule other) {
    if (identical(this, other)) return true;

    return other.day == day && listEquals(other.slots, slots);
  }

  @override
  int get hashCode => day.hashCode ^ slots.hashCode;
}
