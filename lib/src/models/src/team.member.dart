part of '../models.dart';

class TeamMember {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? profileImage;
  List<String>? tokens;

  TeamMember({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.profileImage,
    this.tokens,
  });

  TeamMember copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? profileImage,
    List<String>? tokens,
  }) {
    return TeamMember(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      tokens: tokens ?? this.tokens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'profileImage': profileImage,
      'tokens': tokens,
    };
  }

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
      tokens: map['tokens'] != null ? List<String>.from(map['tokens']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamMember.fromJson(String source) =>
      TeamMember.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Admin(id: $id, name: $name, email: $email, password: $password, phone: $phone, profileImage: $profileImage, tokens: $tokens)';
  }

  @override
  bool operator ==(covariant TeamMember other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.profileImage == profileImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        profileImage.hashCode;
  }
}
