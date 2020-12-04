import 'package:json_annotation/json_annotation.dart';
import "artist.dart";
import "album.dart";
part 'songDetailModel.g.dart';

@JsonSerializable()
class SongDetailModel {
    SongDetailModel();

    String name;
    num id;
    num pst;
    num t;
    List<Artist> ar;
    List alia;
    num pop;
    num st;
    String rt;
    num fee;
    num v;
    String crbt;
    String cf;
    Album al;
    
    factory SongDetailModel.fromJson(Map<String,dynamic> json) => _$SongDetailModelFromJson(json);
    Map<String, dynamic> toJson() => _$SongDetailModelToJson(this);
}
