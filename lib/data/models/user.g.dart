// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    fullName: json['fullName'] as String,
    sessionToken: json['sessionToken'] as String,
    isDriver: json['isDriver'] as bool,
    isHubHero: json['isHubHero'] as bool,
    isLineHaulDriver: json['isLineHaulDriver'] as bool,
    staffId: json['staffId'] as int,
    driverId: json['driverId'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'fullName': instance.fullName,
      'sessionToken': instance.sessionToken,
      'isDriver': instance.isDriver,
      'isHubHero': instance.isHubHero,
      'isLineHaulDriver': instance.isLineHaulDriver,
      'staffId': instance.staffId,
      'driverId': instance.driverId,
    };
