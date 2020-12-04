import 'package:json_annotation/json_annotation.dart';
import "mlogBaseData.dart";
import "mlogExt.dart";
import "user_info.dart";
part 'squareFeedViewDTOListResource.g.dart';

@JsonSerializable()
class SquareFeedViewDTOListResource {
    SquareFeedViewDTOListResource();

    MlogBaseData mlogBaseData;
    MlogExt mlogExt;
    MlogExt mlogExtVO;
    User_info userProfile;
    
    factory SquareFeedViewDTOListResource.fromJson(Map<String,dynamic> json) => _$SquareFeedViewDTOListResourceFromJson(json);
    Map<String, dynamic> toJson() => _$SquareFeedViewDTOListResourceToJson(this);
}
