import 'package:json_annotation/json_annotation.dart';
import "avatardetail.dart";
part 'user_info.g.dart';

@JsonSerializable()
class User_info {
    User_info();

    num userId;
    num vipType;
    num gender;
    num accountStatus;
    num birthday;
    String nickname;
    num avatarImgId;
    num city;
    num backgroundImgId;
    num province;
    String avatarUrl;
    bool defaultAvatar;
    num djStatus;
    bool mutual;
    String remarkName;
    List expertTags;
    num authStatus;
    bool followed;
    String backgroundUrl;
    String detailDescription;
    num userType;
    String avatarImgIdStr;
    String backgroundImgIdStr;
    String description;
    String signature;
    num authority;
    num followeds;
    num follows;
    num eventCount;
    Avatardetail avatarDetail;
    num playlistCount;
    num playlistBeSubscribedCount;
    
    factory User_info.fromJson(Map<String,dynamic> json) => _$User_infoFromJson(json);
    Map<String, dynamic> toJson() => _$User_infoToJson(this);
}
