// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login()
    ..loginType = json['loginType'] as num
    ..code = json['code'] as num
    ..token = json['token'] as String
    ..profile = json['profile'] == null
        ? null
        : User_info.fromJson(json['profile'] as Map<String, dynamic>)
    ..cookie = json['cookie'] as String;
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'loginType': instance.loginType,
      'code': instance.code,
      'token': instance.token,
      'profile': instance.profile,
      'cookie': instance.cookie
    };
