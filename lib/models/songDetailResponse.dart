import 'package:json_annotation/json_annotation.dart';
import "songDetailModel.dart";
part 'songDetailResponse.g.dart';

@JsonSerializable()
class SongDetailResponse {
    SongDetailResponse();

    List<SongDetailModel> songs;
    
    factory SongDetailResponse.fromJson(Map<String,dynamic> json) => _$SongDetailResponseFromJson(json);
    Map<String, dynamic> toJson() => _$SongDetailResponseToJson(this);
}
