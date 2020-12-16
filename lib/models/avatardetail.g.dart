// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatardetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avatardetail _$AvatardetailFromJson(Map<String, dynamic> json) {
  return Avatardetail()
    ..userType = json['userType'] as num
    ..identityLevel = json['identityLevel'] as num
    ..identityIconUrl = json['identityIconUrl'] as String;
}

Map<String, dynamic> _$AvatardetailToJson(Avatardetail instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'identityLevel': instance.identityLevel,
      'identityIconUrl': instance.identityIconUrl
    };
