part of '../models.dart';
enum AppointmentStatus { pending, confirmed, cancelled }

enum AppointmentType {
  firstTime(fee: 700),
  followUp(fee: 500),
  report(fee: 0);

  String get name => toString().split('.').last.capitalize;

  final int fee;
  
  const AppointmentType({required this.fee});
}

enum NotifyMethod { email, sms }

enum Gender { male, female, other }

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
