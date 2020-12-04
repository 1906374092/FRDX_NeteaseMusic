import 'package:json_annotation/json_annotation.dart';
import "uiElement.dart";
import "resource.dart";
part 'creative.g.dart';

@JsonSerializable()
class Creative {
    Creative();

    String creativeType;
    String creativeId;
    String action;
    String actionType;
    String alg;
    num position;
    UiElement uiElement;
    List<Resource> resources;
    
    factory Creative.fromJson(Map<String,dynamic> json) => _$CreativeFromJson(json);
    Map<String, dynamic> toJson() => _$CreativeToJson(this);
}
