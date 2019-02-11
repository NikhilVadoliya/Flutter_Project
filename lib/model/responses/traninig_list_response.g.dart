// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traninig_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingListResponse _$TrainingListResponseFromJson(Map<String, dynamic> json) {
  return TrainingListResponse(json['s'] as bool, json['e'] as int)
    ..d = (json['d'] as List)
        ?.map((e) =>
            e == null ? null : TrainingData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TrainingListResponseToJson(
        TrainingListResponse instance) =>
    <String, dynamic>{'s': instance.s, 'e': instance.e, 'd': instance.d};
