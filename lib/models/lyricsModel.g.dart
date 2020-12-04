// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyricsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LyricsModel _$LyricsModelFromJson(Map<String, dynamic> json) {
  return LyricsModel()
    ..version = json['version'] as num
    ..lyric = json['lyric'] as String;
}

Map<String, dynamic> _$LyricsModelToJson(LyricsModel instance) =>
    <String, dynamic>{'version': instance.version, 'lyric': instance.lyric};
