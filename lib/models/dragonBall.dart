import 'package:json_annotation/json_annotation.dart';

part 'dragonBall.g.dart';

@JsonSerializable()
class DragonBall {
    DragonBall();

    num id;
    String name;
    String iconUrl;
    String url;
    bool skinSupport;
    
    factory DragonBall.fromJson(Map<String,dynamic> json) => _$DragonBallFromJson(json);
    Map<String, dynamic> toJson() => _$DragonBallToJson(this);
}
