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
    return schedules!
        .any((schedule) => hasAtLeastOneTimingInSchedule(schedule));
  }

  bool hasAtLeastOneTimingInSchedule(Schedule schedule) {
    return schedule.timings != null && schedule.timings!.isNotEmpty;
  }
}
