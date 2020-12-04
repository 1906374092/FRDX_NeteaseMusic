import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class Artist {
    Artist();

    String name;
    num id;
    num picId;
    num img1v1Id;
    String briefDesc;
    String picUrl;
    String img1v1Url;
    num albumSize;
    String trans;
    num musicSize;
    num topicPerson;
    
    factory Artist.fromJson(Map<String,dynamic> json) => _$ArtistFromJson(json);
    Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
