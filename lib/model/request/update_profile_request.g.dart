// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return UpdateProfileRequest(
      json['id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['region'] as String,
      json['designation'] as String,
      json['subarea'] as String,
      json['discipline'] as String,
      json['date_of_retirement'] as int,
      json['official_address'] as String,
      json['official_tel'] as String,
      json['residential_address'] as String,
      json['residential_tel'] as String,
      json['gender'] as String);
}

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'region': instance.region,
      'designation': instance.designation,
      'subarea': instance.subarea,
      'discipline': instance.discipline,
      'date_of_retirement': instance.date_of_retirement,
      'official_address': instance.official_address,
      'official_tel': instance.official_tel,
      'residential_address': instance.residential_address,
      'residential_tel': instance.residential_tel,
      'gender': instance.gender
    };
