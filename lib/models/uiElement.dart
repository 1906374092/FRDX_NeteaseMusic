import 'package:json_annotation/json_annotation.dart';
import "titleModel.dart";
import "buttonModel.dart";
import "imageModel.dart";
part 'uiElement.g.dart';

@JsonSerializable()
class UiElement {
    UiElement();

    TitleModel mainTitle;
    TitleModel subTitle;
    ButtonModel button;
    ImageModel image;
    List<String> labelTexts;
    
    factory UiElement.fromJson(Map<String,dynamic> json) => _$UiElementFromJson(json);
    Map<String, dynamic> toJson() => _$UiElementToJson(this);
}
