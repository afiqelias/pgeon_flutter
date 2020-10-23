// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    fullName: json['fullName'] as String,
    sessionToken: json['session_token'] as String,
    isDriver: json['is_driver'] as bool ?? false,
    isHubHero: json['is_hub_hero'] as bool ?? false,
    isLineHaulDriver: json['is_linehaul_driver'] as bool ?? false,
    staffId: json['staff_id'] as int ?? 0,
    driverId: json['driver_id'] as int ?? 0,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'fullName': instance.fullName,
      'session_token': instance.sessionToken,
      'is_driver': instance.isDriver,
      'is_hub_hero': instance.isHubHero,
      'is_linehaul_driver': instance.isLineHaulDriver,
      'staff_id': instance.staffId,
      'driver_id': instance.driverId,
    };
