import 'package:json_annotation/json_annotation.dart';

part 'mlogExt.g.dart';

@JsonSerializable()
class MlogExt {
    MlogExt();

    num commentCount;
    num likedCount;
    num shareCount;
    String rcmdInfo;
    String strongPushMark;
    String strongPushIcon;
    
    factory MlogExt.fromJson(Map<String,dynamic> json) => _$MlogExtFromJson(json);
    Map<String, dynamic> toJson() => _$MlogExtToJson(this);
}
