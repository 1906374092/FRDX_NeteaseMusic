import 'package:json_annotation/json_annotation.dart';

part 'imageModel.g.dart';

@JsonSerializable()
class ImageModel {
    ImageModel();

    String imageUrl;
    
    factory ImageModel.fromJson(Map<String,dynamic> json) => _$ImageModelFromJson(json);
    Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
