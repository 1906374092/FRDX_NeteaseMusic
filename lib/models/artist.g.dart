// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist()
    ..name = json['name'] as String
    ..id = json['id'] as num
    ..picId = json['picId'] as num
    ..img1v1Id = json['img1v1Id'] as num
    ..briefDesc = json['briefDesc'] as String
    ..picUrl = json['picUrl'] as String
    ..img1v1Url = json['img1v1Url'] as String
    ..albumSize = json['albumSize'] as num
    ..trans = json['trans'] as String
    ..musicSize = json['musicSize'] as num
    ..topicPerson = json['topicPerson'] as num;
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picId': instance.picId,
      'img1v1Id': instance.img1v1Id,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'trans': instance.trans,
      'musicSize': instance.musicSize,
      'topicPerson': instance.topicPerson
    };
