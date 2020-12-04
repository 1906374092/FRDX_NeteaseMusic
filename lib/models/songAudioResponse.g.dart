// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songAudioResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongAudioResponse _$SongAudioResponseFromJson(Map<String, dynamic> json) {
  return SongAudioResponse()
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SongAudioModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..code = json['code'] as num;
}

Map<String, dynamic> _$SongAudioResponseToJson(SongAudioResponse instance) =>
    <String, dynamic>{'data': instance.data, 'code': instance.code};
