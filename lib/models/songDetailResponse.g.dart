// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongDetailResponse _$SongDetailResponseFromJson(Map<String, dynamic> json) {
  return SongDetailResponse()
    ..songs = (json['songs'] as List)
        ?.map((e) => e == null
            ? null
            : SongDetailModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SongDetailResponseToJson(SongDetailResponse instance) =>
    <String, dynamic>{'songs': instance.songs};
