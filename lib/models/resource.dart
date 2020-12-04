import 'package:json_annotation/json_annotation.dart';
import "uiElement.dart";
import "resourceExtInfo.dart";
part 'resource.g.dart';

@JsonSerializable()
class Resource {
    Resource();

    UiElement uiElement;
    String resourceType;
    String resourceId;
    String resourceUrl;
    String action;
    String actionType;
    bool valid;
    String alg;
    String logInfo;
    ResourceExtInfo resourceExtInfo;
    
    factory Resource.fromJson(Map<String,dynamic> json) => _$ResourceFromJson(json);
    Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
