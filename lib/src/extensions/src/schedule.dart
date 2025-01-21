part of '../extensions.dart';

extension ScheduleExt on Schedule {
  addTiming(Timing timing) => timings?.add(timing);
  removeTiming(Timing timing) => timings?.remove(timing);

  updateTiming(Timing prev, Timing t) {
    timings?.remove(prev);
    timings?.add(t);
  }
}
