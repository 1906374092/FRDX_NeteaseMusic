// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongData _$SongDataFromJson(Map<String, dynamic> json) {
  return SongData()
    ..name = json['name'] as String
    ..id = json['id'] as num
    ..position = json['position'] as num
    ..status = json['status'] as num
    ..fee = json['fee'] as num
    ..copyrightId = json['copyrightId'] as num
    ..disc = json['disc'] as String
    ..no = json['no'] as num
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..album = json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>)
    ..starred = json['starred'] as bool
    ..popularity = json['popularity'] as num
    ..score = json['score'] as num
    ..starredNum = json['starredNum'] as num
    ..duration = json['duration'] as num
    ..playedNum = json['playedNum'] as num
    ..dayPlays = json['dayPlays'] as num
    ..hearTime = json['hearTime'] as num
    ..copyFrom = json['copyFrom'] as String
    ..commentThreadId = json['commentThreadId'] as String
    ..ftype = json['ftype'] as num
    ..copyright = json['copyright'] as num
    ..transName = json['transName'] as String
    ..sign = json['sign'] as String
    ..mark = json['mark'] as num;
}

Map<String, dynamic> _$SongDataToJson(SongData instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'position': instance.position,
      'status': instance.status,
      'fee': instance.fee,
      'copyrightId': instance.copyrightId,
      'disc': instance.disc,
      'no': instance.no,
      'artists': instance.artists,
      'album': instance.album,
      'starred': instance.starred,
      'popularity': instance.popularity,
      'score': instance.score,
      'starredNum': instance.starredNum,
      'duration': instance.duration,
      'playedNum': instance.playedNum,
      'dayPlays': instance.dayPlays,
      'hearTime': instance.hearTime,
      'copyFrom': instance.copyFrom,
      'commentThreadId': instance.commentThreadId,
      'ftype': instance.ftype,
      'copyright': instance.copyright,
      'transName': instance.transName,
      'sign': instance.sign,
      'mark': instance.mark
    };
