part of '../models.dart';


class DeviceInfo {
  String? deviceId;
  String? token;
  DeviceInfo({
    this.deviceId,
    this.token,
  });

  DeviceInfo copyWith({
    String? deviceId,
    String? token,
  }) {
    return DeviceInfo(
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

  factory DeviceInfo.fromMap(Map<String, dynamic> map) {
    return DeviceInfo(
      deviceId: map['deviceId'] != null ? map['deviceId'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfo.fromJson(String source) =>
      DeviceInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeviceInfo(deviceId: $deviceId, token: $token)';

  @override
  bool operator ==(covariant DeviceInfo other) {
    if (identical(this, other)) return true;

    return other.deviceId == deviceId && other.token == token;
  }

  @override
  int get hashCode => deviceId.hashCode ^ token.hashCode;
}
