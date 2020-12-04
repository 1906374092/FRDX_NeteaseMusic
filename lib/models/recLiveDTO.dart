import 'package:json_annotation/json_annotation.dart';

part 'recLiveDTO.g.dart';

@JsonSerializable()
class RecLiveDTO {
    RecLiveDTO();

    String skipUrl;
    String typeDesc;
    num cardType;
    String alg;
    String anchorId;
    num songId;
    num accompanimentId;
    String supplemetParam;
    String ops;
    num recCoverId;
    String recCover;
    
    factory RecLiveDTO.fromJson(Map<String,dynamic> json) => _$RecLiveDTOFromJson(json);
    Map<String, dynamic> toJson() => _$RecLiveDTOToJson(this);
}
