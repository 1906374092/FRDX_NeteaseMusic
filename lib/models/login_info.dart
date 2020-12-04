import 'package:json_annotation/json_annotation.dart';
import "user_info.dart";
part 'login_info.g.dart';

@JsonSerializable()
class Login_info {
    Login_info();

    num loginType;
    num code;
    String token;
    User_info profile;
    String cookie;
    
    factory Login_info.fromJson(Map<String,dynamic> json) => _$Login_infoFromJson(json);
    Map<String, dynamic> toJson() => _$Login_infoToJson(this);
}
