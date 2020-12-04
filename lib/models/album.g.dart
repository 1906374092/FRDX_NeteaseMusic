// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album()
    ..name = json['name'] as String
    ..id = json['id'] as num
    ..type = json['type'] as String
    ..size = json['size'] as num
    ..picId = json['picId'] as num
    ..blurPicUrl = json['blurPicUrl'] as String
    ..companyId = json['companyId'] as num
    ..pic = json['pic'] as num
    ..picUrl = json['picUrl'] as String
    ..publishTime = json['publishTime'] as num
    ..description = json['description'] as String
    ..tags = json['tags'] as String
    ..company = json['company'] as String
    ..briefDesc = json['briefDesc'] as String
    ..artist = json['artist'] == null
        ? null
        : Artist.fromJson(json['artist'] as Map<String, dynamic>)
    ..songs = (json['songs'] as List)
        ?.map((e) =>
            e == null ? null : SongData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..status = json['status'] as num
    ..copyrightId = json['copyrightId'] as num
    ..commentThreadId = json['commentThreadId'] as String
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..subType = json['subType'] as String
    ..transName = json['transName'] as String
    ..mark = json['mark'] as num
    ..picId_str = json['picId_str'] as String;
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'size': instance.size,
      'picId': instance.picId,
      'blurPicUrl': instance.blurPicUrl,
      'companyId': instance.companyId,
      'pic': instance.pic,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'description': instance.description,
      'tags': instance.tags,
      'company': instance.company,
      'briefDesc': instance.briefDesc,
      'artist': instance.artist,
      'songs': instance.songs,
      'status': instance.status,
      'copyrightId': instance.copyrightId,
      'commentThreadId': instance.commentThreadId,
      'artists': instance.artists,
      'subType': instance.subType,
      'transName': instance.transName,
      'mark': instance.mark,
      'picId_str': instance.picId_str
    };
