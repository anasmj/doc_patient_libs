part of '../extensions.dart';

extension ChemberExt on Chember {
  bool get isValid => hasValidInfo && hasValidSchedule;

  bool get hasValidInfo {
    return name != null &&
        address != null &&
        roomNo != null &&
        floor != null &&
        phone != null;
  }

  bool get hasValidSchedule {
    if (schedules == null || schedules!.isEmpty) return false;
    return schedules!.any((schedule) => hasAtLeastOneSlotInSchedule(schedule));
  }

  bool hasAtLeastOneSlotInSchedule(Schedule schedule) {
    return schedule.slots != null && schedule.slots!.isNotEmpty;
  }
}
