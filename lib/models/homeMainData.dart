import 'package:json_annotation/json_annotation.dart';
import "homeBlock.dart";
part 'homeMainData.g.dart';

@JsonSerializable()
class HomeMainData {
    HomeMainData();

    bool hasMore;
    String blockUUIDs;
    List<HomeBlock> blocks;
    
    factory HomeMainData.fromJson(Map<String,dynamic> json) => _$HomeMainDataFromJson(json);
    Map<String, dynamic> toJson() => _$HomeMainDataToJson(this);
}
