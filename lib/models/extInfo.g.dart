// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtInfo _$ExtInfoFromJson(Map<String, dynamic> json) {
  return ExtInfo()
    ..moduleName = json['moduleName'] as String
    ..moduleId = json['moduleId'] as String
    ..orpheusUrl = json['orpheusUrl'] as String
    ..alg = json['alg'] as String
    ..log_info = json['log_info'] as String
    ..squareFeedViewDTOList = (json['squareFeedViewDTOList'] as List)
        ?.map((e) => e == null
            ? null
            : SquareFeedViewDTOList.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..popularity = json['popularity'] as num
    ..verticalCoverId = json['verticalCoverId'] as num
    ..verticalCover = json['verticalCover'] as String
    ..userInfo = json['userInfo'] == null
        ? null
        : User_info.fromJson(json['userInfo'] as Map<String, dynamic>)
    ..coverTag = json['coverTag'] as String
    ..privateTag = json['privateTag'] as String
    ..borderTag = json['borderTag'] as String
    ..startStreamTagName = json['startStreamTagName'] as String
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..dynamicCover = json['dynamicCover'] == null
        ? null
        : DynamicCover.fromJson(json['dynamicCover'] as Map<String, dynamic>)
    ..liveId = json['liveId'] as num
    ..title = json['title'] as String
    ..anchorId = json['anchorId'] as num
    ..coverId = json['coverId'] as num
    ..cover = json['cover'] as String
    ..liveUrl = json['liveUrl'] == null
        ? null
        : LiveUrl.fromJson(json['liveUrl'] as Map<String, dynamic>)
    ..playBackUrl = json['playBackUrl'] as String
    ..orientationScope = json['orientationScope'] as num
    ..onlineNumber = json['onlineNumber'] as num
    ..liveStatus = json['liveStatus'] as num
    ..startTime = json['startTime'] as num
    ..endTime = json['endTime'] as num
    ..roomId = json['roomId'] as num
    ..channelId = json['channelId'] as String
    ..liveType = json['liveType'] as num
    ..appKeyType = json['appKeyType'] as num
    ..type = json['type'] as num
    ..startStreamTag = json['startStreamTag'] as num
    ..agoraRoomNo = json['agoraRoomNo'] as num
    ..bgCoverUrl = json['bgCoverUrl'] as String
    ..backgroundAnimateUrl = json['backgroundAnimateUrl'] as String;
}

Map<String, dynamic> _$ExtInfoToJson(ExtInfo instance) => <String, dynamic>{
      'moduleName': instance.moduleName,
      'moduleId': instance.moduleId,
      'orpheusUrl': instance.orpheusUrl,
      'alg': instance.alg,
      'log_info': instance.log_info,
      'squareFeedViewDTOList': instance.squareFeedViewDTOList,
      'popularity': instance.popularity,
      'verticalCoverId': instance.verticalCoverId,
      'verticalCover': instance.verticalCover,
      'userInfo': instance.userInfo,
      'coverTag': instance.coverTag,
      'privateTag': instance.privateTag,
      'borderTag': instance.borderTag,
      'startStreamTagName': instance.startStreamTagName,
      'tags': instance.tags,
      'dynamicCover': instance.dynamicCover,
      'liveId': instance.liveId,
      'title': instance.title,
      'anchorId': instance.anchorId,
      'coverId': instance.coverId,
      'cover': instance.cover,
      'liveUrl': instance.liveUrl,
      'playBackUrl': instance.playBackUrl,
      'orientationScope': instance.orientationScope,
      'onlineNumber': instance.onlineNumber,
      'liveStatus': instance.liveStatus,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'roomId': instance.roomId,
      'channelId': instance.channelId,
      'liveType': instance.liveType,
      'appKeyType': instance.appKeyType,
      'type': instance.type,
      'startStreamTag': instance.startStreamTag,
      'agoraRoomNo': instance.agoraRoomNo,
      'bgCoverUrl': instance.bgCoverUrl,
      'backgroundAnimateUrl': instance.backgroundAnimateUrl
    };
