import 'package:json_annotation/json_annotation.dart';
import "artist.dart";
import "songData.dart";
part 'album.g.dart';

@JsonSerializable()
class Album {
    Album();

    String name;
    num id;
    String type;
    num size;
    num picId;
    String blurPicUrl;
    num companyId;
    num pic;
    String picUrl;
    num publishTime;
    String description;
    String tags;
    String company;
    String briefDesc;
    Artist artist;
    List<SongData> songs;
    num status;
    num copyrightId;
    String commentThreadId;
    List<Artist> artists;
    String subType;
    String transName;
    num mark;
    String picId_str;
    
    factory Album.fromJson(Map<String,dynamic> json) => _$AlbumFromJson(json);
    Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
