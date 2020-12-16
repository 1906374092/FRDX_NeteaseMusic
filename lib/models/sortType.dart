import 'package:json_annotation/json_annotation.dart';

part 'sortType.g.dart';

@JsonSerializable()
class SortType {
    SortType();

    num sortType;
    String sortTypeName;
    String target;
    
    factory SortType.fromJson(Map<String,dynamic> json) => _$SortTypeFromJson(json);
    Map<String, dynamic> toJson() => _$SortTypeToJson(this);
}
