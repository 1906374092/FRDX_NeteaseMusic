import 'package:json_annotation/json_annotation.dart';
import "dragonBall.dart";
part 'home_ball.g.dart';

@JsonSerializable()
class Home_ball {
    Home_ball();

    num code;
    List<DragonBall> data;
    String message;
    
    factory Home_ball.fromJson(Map<String,dynamic> json) => _$Home_ballFromJson(json);
    Map<String, dynamic> toJson() => _$Home_ballToJson(this);
}
