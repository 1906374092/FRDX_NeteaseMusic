import 'package:json_annotation/json_annotation.dart';
import "artist.dart";
import "songData.dart";
part 'resourceExtInfo.g.dart';

@JsonSerializable()
class ResourceExtInfo {
    ResourceExtInfo();

    num playCount;
    bool highQuality;
    List<Artist> artists;
    String action;
    String actionType;
    bool valid;
    String alg;
    String logInfo;
    SongData songData;
    
    factory ResourceExtInfo.fromJson(Map<String,dynamic> json) => _$ResourceExtInfoFromJson(json);
    Map<String, dynamic> toJson() => _$ResourceExtInfoToJson(this);
}
