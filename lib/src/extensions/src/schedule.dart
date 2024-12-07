part of '../extensions.dart';

extension ScheduleExt on Schedule {
  addSlot(Slot slot) => slots?.add(slot);
  removeSlot(Slot slot) => slots?.remove(slot);

  updateSlot(Slot prev, Slot newSlot) {
    slots?.remove(prev);
    slots?.add(newSlot);
  }
}
