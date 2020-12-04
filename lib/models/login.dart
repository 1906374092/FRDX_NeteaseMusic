import 'package:json_annotation/json_annotation.dart';
import "user_info.dart";
part 'login.g.dart';

@JsonSerializable()
class Login {
    Login();

    num loginType;
    num code;
    String token;
    User_info profile;
    String cookie;
    
    factory Login.fromJson(Map<String,dynamic> json) => _$LoginFromJson(json);
    Map<String, dynamic> toJson() => _$LoginToJson(this);
}
