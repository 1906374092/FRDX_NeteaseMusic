// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squareFeedViewDTOListResource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareFeedViewDTOListResource _$SquareFeedViewDTOListResourceFromJson(
    Map<String, dynamic> json) {
  return SquareFeedViewDTOListResource()
    ..mlogBaseData = json['mlogBaseData'] == null
        ? null
        : MlogBaseData.fromJson(json['mlogBaseData'] as Map<String, dynamic>)
    ..mlogExt = json['mlogExt'] == null
        ? null
        : MlogExt.fromJson(json['mlogExt'] as Map<String, dynamic>)
    ..mlogExtVO = json['mlogExtVO'] == null
        ? null
        : MlogExt.fromJson(json['mlogExtVO'] as Map<String, dynamic>)
    ..userProfile = json['userProfile'] == null
        ? null
        : User_info.fromJson(json['userProfile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SquareFeedViewDTOListResourceToJson(
        SquareFeedViewDTOListResource instance) =>
    <String, dynamic>{
      'mlogBaseData': instance.mlogBaseData,
      'mlogExt': instance.mlogExt,
      'mlogExtVO': instance.mlogExtVO,
      'userProfile': instance.userProfile
    };
