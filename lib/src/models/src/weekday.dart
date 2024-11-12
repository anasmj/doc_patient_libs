part of '../models.dart';

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  @override
  toString() => super.toString().split('.').last;
  Weekday toWeekday(String str) {
    return Weekday.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == str.toLowerCase(),
    );
  }

  static Weekday? fromString(String day) {
    return Weekday.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == day.toLowerCase(),
    );
  }
}
