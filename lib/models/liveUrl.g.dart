// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveUrl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveUrl _$LiveUrlFromJson(Map<String, dynamic> json) {
  return LiveUrl()
    ..httpPullUrl = json['httpPullUrl'] as String
    ..hlsPullUrl = json['hlsPullUrl'] as String
    ..rtmpPullUrl = json['rtmpPullUrl'] as String;
}

Map<String, dynamic> _$LiveUrlToJson(LiveUrl instance) => <String, dynamic>{
      'httpPullUrl': instance.httpPullUrl,
      'hlsPullUrl': instance.hlsPullUrl,
      'rtmpPullUrl': instance.rtmpPullUrl
    };
