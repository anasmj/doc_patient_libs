// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class PatientData {
  String? name;
  Gender? gender;
  String? phone;
  int? age;
  String? note;

  PatientData({
    this.name,
    this.gender = Gender.male,
    this.phone,
    this.age,
    this.note,
  });

  PatientData copyWith({
    String? name,
    Gender? gender,
    String? phone,
    int? age,
    String? email,
    String? address,
    String? note,
  }) {
    return PatientData(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': EnumToString.convertToString(gender),
      'phone': phone,
      'age': age,
      'note': note,
    };
  }

  factory PatientData.fromMap(Map<String, dynamic> map) {
    return PatientData(
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null
          ? EnumToString.fromString(Gender.values, map['gender'] as String)
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientData.fromJson(String source) =>
      PatientData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientData(name: $name, gender: $gender, phone: $phone, age: $age,  note: $note)';
  }

  @override
  bool operator ==(covariant PatientData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.gender == gender &&
        other.phone == phone &&
        other.age == age &&
        other.note == note;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        gender.hashCode ^
        phone.hashCode ^
        age.hashCode ^
        note.hashCode;
  }
}

extension PatientDataExt on PatientData {
  bool get isMale => gender == Gender.male;
  bool get isFemale => gender == Gender.female;
  bool get isOther => gender == Gender.other;
  bool get isValid => name != null && phone != null;
}
