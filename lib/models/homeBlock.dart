import 'package:json_annotation/json_annotation.dart';
import "uiElement.dart";
import "creative.dart";
import "extInfo.dart";
part 'homeBlock.g.dart';

@JsonSerializable()
class HomeBlock {
    HomeBlock();

    String blockCode;
    String showType;
    String action;
    String actionType;
    bool canClose;
    UiElement uiElement;
    List<Creative> creatives;
    List<ExtInfo> extInfo;
    
    factory HomeBlock.fromJson(Map<String,dynamic> json) => _$HomeBlockFromJson(json);
    Map<String, dynamic> toJson() => _$HomeBlockToJson(this);
}
