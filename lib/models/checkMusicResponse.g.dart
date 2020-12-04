// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkMusicResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckMusicResponse _$CheckMusicResponseFromJson(Map<String, dynamic> json) {
  return CheckMusicResponse()
    ..success = json['success'] as bool
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CheckMusicResponseToJson(CheckMusicResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};
