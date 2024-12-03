part of '../models.dart';

class UserDevice {
  String? deviceId;
  String? token;
  UserDevice({this.deviceId, this.token});

  UserDevice copyWith({
    String? deviceId,
    String? token,
  }) {
    return UserDevice(
      deviceId: deviceId ?? this.deviceId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviceId': deviceId,
      'token': token,
    };
  }

  factory UserDevice.fromMap(Map<String, dynamic> map) {
    return UserDevice(
      deviceId: map['deviceId'] != null ? map['deviceId'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDevice.fromJson(String source) =>
      UserDevice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDevice(deviceId: $deviceId, token: $token)';

  @override
  bool operator ==(covariant UserDevice other) {
    if (identical(this, other)) return true;

    return other.deviceId == deviceId && other.token == token;
  }

  @override
  int get hashCode => deviceId.hashCode ^ token.hashCode;
}
