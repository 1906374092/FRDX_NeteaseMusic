// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongDetailModel _$SongDetailModelFromJson(Map<String, dynamic> json) {
  return SongDetailModel()
    ..name = json['name'] as String
    ..id = json['id'] as num
    ..pst = json['pst'] as num
    ..t = json['t'] as num
    ..ar = (json['ar'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..alia = json['alia'] as List
    ..pop = json['pop'] as num
    ..st = json['st'] as num
    ..rt = json['rt'] as String
    ..fee = json['fee'] as num
    ..v = json['v'] as num
    ..crbt = json['crbt'] as String
    ..cf = json['cf'] as String
    ..al = json['al'] == null
        ? null
        : Album.fromJson(json['al'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SongDetailModelToJson(SongDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'pst': instance.pst,
      't': instance.t,
      'ar': instance.ar,
      'alia': instance.alia,
      'pop': instance.pop,
      'st': instance.st,
      'rt': instance.rt,
      'fee': instance.fee,
      'v': instance.v,
      'crbt': instance.crbt,
      'cf': instance.cf,
      'al': instance.al
    };
