import 'package:json_annotation/json_annotation.dart';

part 'checkMusicResponse.g.dart';

@JsonSerializable()
class CheckMusicResponse {
    CheckMusicResponse();

    bool success;
    String message;
    
    factory CheckMusicResponse.fromJson(Map<String,dynamic> json) => _$CheckMusicResponseFromJson(json);
    Map<String, dynamic> toJson() => _$CheckMusicResponseToJson(this);
}
