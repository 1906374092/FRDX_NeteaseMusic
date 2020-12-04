import 'package:json_annotation/json_annotation.dart';

part 'buttonModel.g.dart';

@JsonSerializable()
class ButtonModel {
    ButtonModel();

    String action;
    String actionType;
    String text;
    String iconUrl;
    
    factory ButtonModel.fromJson(Map<String,dynamic> json) => _$ButtonModelFromJson(json);
    Map<String, dynamic> toJson() => _$ButtonModelToJson(this);
}
