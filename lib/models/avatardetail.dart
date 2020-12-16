import 'package:json_annotation/json_annotation.dart';

part 'avatardetail.g.dart';

@JsonSerializable()
class Avatardetail {
    Avatardetail();

    num userType;
    num identityLevel;
    String identityIconUrl;
    
    factory Avatardetail.fromJson(Map<String,dynamic> json) => _$AvatardetailFromJson(json);
    Map<String, dynamic> toJson() => _$AvatardetailToJson(this);
}
