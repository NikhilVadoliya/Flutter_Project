// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  return SignUpRequest(
      json['emp_id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['mobile'] as String,
      json['email'] as String,
      json['password'] as String,
      json['designation'] as String,
      json['gender'] as String,
      json['official_address'] as String,
      json['official_tel'] as String,
      json['residential_address'] as String,
      json['residential_tel'] as String,
      json['subarea'] as String,
      json['discipline'] as String,
      json['region'] as String,
      json['date_of_retirement'] as int);
}

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'emp_id': instance.emp_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'mobile': instance.mobile,
      'email': instance.email,
      'password': instance.password,
      'designation': instance.designation,
      'gender': instance.gender,
      'official_address': instance.official_address,
      'official_tel': instance.official_tel,
      'residential_address': instance.residential_address,
      'residential_tel': instance.residential_tel,
      'subarea': instance.subarea,
      'discipline': instance.discipline,
      'region': instance.region,
      'date_of_retirement': instance.date_of_retirement
    };
