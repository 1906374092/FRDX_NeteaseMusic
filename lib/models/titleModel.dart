import 'package:json_annotation/json_annotation.dart';

part 'titleModel.g.dart';

@JsonSerializable()
class TitleModel {
    TitleModel();

    String title;
    String titleType;
    
    factory TitleModel.fromJson(Map<String,dynamic> json) => _$TitleModelFromJson(json);
    Map<String, dynamic> toJson() => _$TitleModelToJson(this);
}
