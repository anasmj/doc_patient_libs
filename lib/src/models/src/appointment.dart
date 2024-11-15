// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';



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
    DateTime? dateTime,
    Chember? chember,
    AppointmentType? type,
    AppointmentStatus? status,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientData: patientData ?? this.patientData,
      dateTime: dateTime ?? this.dateTime,
      chember: chember ?? this.chember,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'patientData': patientData?.toMap(),
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'chember': chember?.toMap(),
      'type': EnumToString.convertToString(type),
      'status': EnumToString.convertToString(status)
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'] != null ? map['id'] as String : null,
      patientData: map['patientData'] != null
          ? PatientData.fromMap(map['patientData'] as Map<String, dynamic>)
          : null,
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
      chember: map['chember'] != null
          ? Chember.fromMap(map['chember'] as Map<String, dynamic>)
          : null,
      type: map['type'] != null
          ? EnumToString.fromString(AppointmentType.values, map['type'])
          : null,
      status: map['status'] != null
          ? EnumToString.fromString(AppointmentStatus.values, map['status'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appointment(id: $id, patientData: $patientData, dateTime: $dateTime, chember: $chember, type: $type, status: $status)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.patientData == patientData &&
        other.dateTime == dateTime &&
        other.chember == chember &&
        other.type == type &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        patientData.hashCode ^
        dateTime.hashCode ^
        chember.hashCode ^
        type.hashCode ^
        status.hashCode;
  }
}



extension AppointmentExt on Appointment {
  bool get isPending => status == AppointmentStatus.pending;
  bool get isConfirmed => status == AppointmentStatus.confirmed;
  bool get isCancelled => status == AppointmentStatus.cancelled;
  bool get isValid => dateTime != null && chember != null;
}

extension EnumExtension on Enum {
  // Converts an enum value to a string
  String get toEnumString => toString().split('.').last;

  // Converts a string to an enum value
  T? fromEnumString<T extends Enum>(String value, List<T> enumValues) {
    return enumValues.firstWhere(
      (e) => e.toString().split('.').last == value,
    );
  }
}
