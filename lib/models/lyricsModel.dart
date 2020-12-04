import 'package:json_annotation/json_annotation.dart';

part 'lyricsModel.g.dart';

@JsonSerializable()
class LyricsModel {
    LyricsModel();

    num version;
    String lyric;
    
    factory LyricsModel.fromJson(Map<String,dynamic> json) => _$LyricsModelFromJson(json);
    Map<String, dynamic> toJson() => _$LyricsModelToJson(this);
}
