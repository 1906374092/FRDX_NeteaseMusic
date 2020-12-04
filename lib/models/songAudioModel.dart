import 'package:json_annotation/json_annotation.dart';

part 'songAudioModel.g.dart';

@JsonSerializable()
class SongAudioModel {
    SongAudioModel();

    num id;
    String url;
    num br;
    num size;
    String md5;
    num code;
    num expi;
    String type;
    num gain;
    num fee;
    String uf;
    num payed;
    num flag;
    bool canExtend;
    String freeTrialInfo;
    String level;
    String encodeType;
    num urlSource;
    
    factory SongAudioModel.fromJson(Map<String,dynamic> json) => _$SongAudioModelFromJson(json);
    Map<String, dynamic> toJson() => _$SongAudioModelToJson(this);
}
