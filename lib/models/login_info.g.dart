// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login_info _$Login_infoFromJson(Map<String, dynamic> json) {
  return Login_info()
    ..loginType = json['loginType'] as num
    ..code = json['code'] as num
    ..token = json['token'] as String
    ..profile = json['profile'] == null
        ? null
        : User_info.fromJson(json['profile'] as Map<String, dynamic>)
    ..cookie = json['cookie'] as String;
}

Map<String, dynamic> _$Login_infoToJson(Login_info instance) =>
    <String, dynamic>{
      'loginType': instance.loginType,
      'code': instance.code,
      'token': instance.token,
      'profile': instance.profile,
      'cookie': instance.cookie
    };
