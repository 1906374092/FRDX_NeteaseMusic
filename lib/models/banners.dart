import 'package:json_annotation/json_annotation.dart';
import "banner_item.dart";
part 'banners.g.dart';

@JsonSerializable()
class Banners {
    Banners();

    List<Banner_item> banners;
    num code;
    
    factory Banners.fromJson(Map<String,dynamic> json) => _$BannersFromJson(json);
    Map<String, dynamic> toJson() => _$BannersToJson(this);
}
