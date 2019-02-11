// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingListRequest _$TrainingListRequestFromJson(Map<String, dynamic> json) {
  return TrainingListRequest(
      json['filters'] == null
          ? null
          : Filter.fromJson(json['filters'] as Map<String, dynamic>),
      json['searchQuery'] as String);
}

Map<String, dynamic> _$TrainingListRequestToJson(
        TrainingListRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'searchQuery': instance.searchQuery
    };

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return Filter(
      (json['organization'] as List)?.map((e) => e as String)?.toList(),
      (json['category'] as List)?.map((e) => e as String)?.toList(),
      (json['trainingMonth'] as List)?.map((e) => e as String)?.toList(),
      (json['levelOfParticipants'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'organization': instance.organization,
      'category': instance.category,
      'trainingMonth': instance.trainingMonth,
      'levelOfParticipants': instance.levelOfParticipants
    };
