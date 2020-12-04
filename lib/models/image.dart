import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
    Image();

    String imageUrl;
    
    factory Image.fromJson(Map<String,dynamic> json) => _$ImageFromJson(json);
    Map<String, dynamic> toJson() => _$ImageToJson(this);
}
