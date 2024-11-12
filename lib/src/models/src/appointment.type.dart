part of '../models.dart';

 

enum AppointmentType {
  firstTime(fee: 700),
  followUp(fee: 500),
  report(fee: 0);

  String get name => toString().split('.').last.capitalize;

  final int fee;
  const AppointmentType({required this.fee});
}
