import 'package:json_annotation/json_annotation.dart';
import "squareFeedViewDTOListResource.dart";
part 'squareFeedViewDTOList.g.dart';

@JsonSerializable()
class SquareFeedViewDTOList {
    SquareFeedViewDTOList();

    String id;
    num type;
    String typeDesc;
    num position;
    String alg;
    String log_info;
    String reason;
    SquareFeedViewDTOListResource resource;
    
    factory SquareFeedViewDTOList.fromJson(Map<String,dynamic> json) => _$SquareFeedViewDTOListFromJson(json);
    Map<String, dynamic> toJson() => _$SquareFeedViewDTOListToJson(this);
}
