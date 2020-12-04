import 'package:json_annotation/json_annotation.dart';
import "songAudioModel.dart";
part 'songAudioResponse.g.dart';

@JsonSerializable()
class SongAudioResponse {
    SongAudioResponse();

    List<SongAudioModel> data;
    num code;
    
    factory SongAudioResponse.fromJson(Map<String,dynamic> json) => _$SongAudioResponseFromJson(json);
    Map<String, dynamic> toJson() => _$SongAudioResponseToJson(this);
}
