// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_info _$User_infoFromJson(Map<String, dynamic> json) {
  return User_info()
    ..userId = json['userId'] as num
    ..vipType = json['vipType'] as num
    ..gender = json['gender'] as num
    ..accountStatus = json['accountStatus'] as num
    ..birthday = json['birthday'] as num
    ..nickname = json['nickname'] as String
    ..avatarImgId = json['avatarImgId'] as num
    ..city = json['city'] as num
    ..backgroundImgId = json['backgroundImgId'] as num
    ..province = json['province'] as num
    ..avatarUrl = json['avatarUrl'] as String
    ..defaultAvatar = json['defaultAvatar'] as bool
    ..djStatus = json['djStatus'] as num
    ..mutual = json['mutual'] as bool
    ..remarkName = json['remarkName'] as String
    ..expertTags = json['expertTags'] as List
    ..authStatus = json['authStatus'] as num
    ..followed = json['followed'] as bool
    ..backgroundUrl = json['backgroundUrl'] as String
    ..detailDescription = json['detailDescription'] as String
    ..userType = json['userType'] as num
    ..avatarImgIdStr = json['avatarImgIdStr'] as String
    ..backgroundImgIdStr = json['backgroundImgIdStr'] as String
    ..description = json['description'] as String
    ..signature = json['signature'] as String
    ..authority = json['authority'] as num
    ..followeds = json['followeds'] as num
    ..follows = json['follows'] as num
    ..eventCount = json['eventCount'] as num
    ..avatarDetail = json['avatarDetail'] == null
        ? null
        : Avatardetail.fromJson(json['avatarDetail'] as Map<String, dynamic>)
    ..playlistCount = json['playlistCount'] as num
    ..playlistBeSubscribedCount = json['playlistBeSubscribedCount'] as num;
}

Map<String, dynamic> _$User_infoToJson(User_info instance) => <String, dynamic>{
      'userId': instance.userId,
      'vipType': instance.vipType,
      'gender': instance.gender,
      'accountStatus': instance.accountStatus,
      'birthday': instance.birthday,
      'nickname': instance.nickname,
      'avatarImgId': instance.avatarImgId,
      'city': instance.city,
      'backgroundImgId': instance.backgroundImgId,
      'province': instance.province,
      'avatarUrl': instance.avatarUrl,
      'defaultAvatar': instance.defaultAvatar,
      'djStatus': instance.djStatus,
      'mutual': instance.mutual,
      'remarkName': instance.remarkName,
      'expertTags': instance.expertTags,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'backgroundUrl': instance.backgroundUrl,
      'detailDescription': instance.detailDescription,
      'userType': instance.userType,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'description': instance.description,
      'signature': instance.signature,
      'authority': instance.authority,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'eventCount': instance.eventCount,
      'avatarDetail': instance.avatarDetail,
      'playlistCount': instance.playlistCount,
      'playlistBeSubscribedCount': instance.playlistBeSubscribedCount
    };
