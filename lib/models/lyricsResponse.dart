import 'package:json_annotation/json_annotation.dart';
import "lyricsModel.dart";
part 'lyricsResponse.g.dart';

@JsonSerializable()
class LyricsResponse {
    LyricsResponse();

    bool sgc;
    bool sfy;
    bool qfy;
    LyricsModel lrc;
    num code;
    
    factory LyricsResponse.fromJson(Map<String,dynamic> json) => _$LyricsResponseFromJson(json);
    Map<String, dynamic> toJson() => _$LyricsResponseToJson(this);
}
