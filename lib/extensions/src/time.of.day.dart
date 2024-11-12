part of '../extensions.dart';

extension TimeOfDayExtension on TimeOfDay {
  String get to12Hour {
    final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final minute = this.minute.toString().padLeft(2, '0');
    final period = this.period == DayPeriod.am ? 'am' : 'pm';

    return '${hour.toString().padLeft(2, '0')} : $minute $period';
  }
}
