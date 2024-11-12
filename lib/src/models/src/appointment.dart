// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';


// import 'appointment.type.dart';
// import 'chember.dart';
// import 'patient.data.dart';


enum AppointmentStatus { pending, confirmed, cancelled }

class Appointment {
  final String? id;
  final PatientData? patientData;
  final DateTime? dateTime;
  final Chember? chember;
  final AppointmentType? type;

  final AppointmentStatus? status;

  Appointment({
    this.id,
    this.patientData,
    this.dateTime,
    this.chember,
    this.type = AppointmentType.firstTime,
    this.status = AppointmentStatus.pending,
  });

  Appointment copyWith({
    String? id,
    PatientData? patientData,
    String? weekDay,
    Chember? chember,
    DateTime? dateTime,
    AppointmentType? type,
    AppointmentStatus? status,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientData: patientData ?? this.patientData,
      chember: chember ?? this.chember,
      type: type ?? this.type,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'patientData': patientData?.toMap(),
      // 'date': date?.millisecondsSinceEpoch,
      // 'weekDay': weekDay,
      // 'apptTime': apptTime?.toMap(),
      // 'chember': chember?.toMap(),
      // 'isFirstTime': isFirstTime,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
        // patientData: map['patientData'] != null ? PatientData.fromMap(map['patientData'] as Map<String,dynamic>) : null,
        // date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int) : null,
        // weekDay: map['weekDay'] != null ? map['weekDay'] as String : null,
        // apptTime: map['apptTime'] != null ? TimeOfDay.fromMap(map['apptTime'] as Map<String,dynamic>) : null,
        // chember: map['chember'] != null ? Chember.fromMap(map['chember'] as Map<String,dynamic>) : null,
        // isFirstTime: map['isFirstTime'] != null ? map['isFirstTime'] as bool : null,
        );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'patientt : ${patientData?.name}, status : $status\n';
  }
  // String toString() {
  //   return 'Appointment(patientData: $patientData, date: $dateTime , chember: $chember, isFirstTime: $isFirstTime)';
  // }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

enum NotifyMethod { email, sms }

extension AppointmentExt on Appointment {
  bool get isPending => status == AppointmentStatus.pending;
  bool get isConfirmed => status == AppointmentStatus.confirmed;
  bool get isCancelled => status == AppointmentStatus.cancelled;
  bool get isValid => dateTime != null && chember != null;
}
