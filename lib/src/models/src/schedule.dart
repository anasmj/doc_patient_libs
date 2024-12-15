part of '../models.dart';

class Schedule {
  final String? id;
  final Weekday day;
  final List<Slot>? slots;

  Schedule({
    this.id,
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
    String? id,
    Weekday? day,
    List<Slot>? slots,
  }) {
    return Schedule(
      id: id ?? this.id,
      day: day ?? this.day,
      slots: slots ?? this.slots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day.toString(),
      'slots': slots?.map((x) => x.toMap()).toList(),
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'] as String,
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
    if (other.runtimeType != runtimeType) return false;
    if (identical(this, other)) return true;

    return other.id == id && other.day == day && listEquals(other.slots, slots);
  }

  @override
  int get hashCode => id.hashCode ^ day.hashCode ^ slots.hashCode;
}
