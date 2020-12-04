import 'package:json_annotation/json_annotation.dart';
import "artist.dart";
import "album.dart";
part 'songData.g.dart';

@JsonSerializable()
class SongData {
    SongData();

    String name;
    num id;
    num position;
    num status;
    num fee;
    num copyrightId;
    String disc;
    num no;
    List<Artist> artists;
    Album album;
    bool starred;
    num popularity;
    num score;
    num starredNum;
    num duration;
    num playedNum;
    num dayPlays;
    num hearTime;
    String copyFrom;
    String commentThreadId;
    num ftype;
    num copyright;
    String transName;
    String sign;
    num mark;
    
    factory SongData.fromJson(Map<String,dynamic> json) => _$SongDataFromJson(json);
    Map<String, dynamic> toJson() => _$SongDataToJson(this);
}
