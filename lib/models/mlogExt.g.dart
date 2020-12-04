// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mlogExt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MlogExt _$MlogExtFromJson(Map<String, dynamic> json) {
  return MlogExt()
    ..commentCount = json['commentCount'] as num
    ..likedCount = json['likedCount'] as num
    ..shareCount = json['shareCount'] as num
    ..rcmdInfo = json['rcmdInfo'] as String
    ..strongPushMark = json['strongPushMark'] as String
    ..strongPushIcon = json['strongPushIcon'] as String;
}

Map<String, dynamic> _$MlogExtToJson(MlogExt instance) => <String, dynamic>{
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'rcmdInfo': instance.rcmdInfo,
      'strongPushMark': instance.strongPushMark,
      'strongPushIcon': instance.strongPushIcon
    };
