// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(json['s'] as bool, json['e'] as int)
    ..d = json['d'] == null
        ? null
        : UserDataProfile.fromJson(json['d'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{'s': instance.s, 'e': instance.e, 'd': instance.d};

UserDataProfile _$UserDataProfileFromJson(Map<String, dynamic> json) {
  return UserDataProfile(
      json['attendee'] == null
          ? null
          : Attendee.fromJson(json['attendee'] as Map<String, dynamic>),
      (json['regions'] as List)
          ?.map((e) => e == null
              ? null
              : RequireData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UserDataProfileToJson(UserDataProfile instance) =>
    <String, dynamic>{
      'attendee': instance.attendee,
      'regions': instance.regions
    };

Attendee _$AttendeeFromJson(Map<String, dynamic> json) {
  return Attendee(
      json['id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['designation'] as String,
      json['mobile_number'] as String,
      json['email'] as String,
      json['gender'] as String,
      json['official_address'] as String,
      json['official_tel'] as String,
      json['residential_address'] as String,
      json['residential_tel'] as String,
      json['user_id'] as String,
      json['created_date'] as int,
      json['last_modified_by'] as String,
      json['last_modified_date'] as int,
      json['is_active'] as bool,
      json['is_deleted'] as bool,
      json['subarea'] as String,
      json['discipline'] as String,
      json['emp_id'] as String,
      json['region'] as String,
      json['date_of_retirement'] as int);
}

Map<String, dynamic> _$AttendeeToJson(Attendee instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'designation': instance.designation,
      'mobile_number': instance.mobile_number,
      'email': instance.email,
      'gender': instance.gender,
      'official_address': instance.official_address,
      'official_tel': instance.official_tel,
      'residential_address': instance.residential_address,
      'residential_tel': instance.residential_tel,
      'user_id': instance.user_id,
      'created_date': instance.created_date,
      'last_modified_by': instance.last_modified_by,
      'last_modified_date': instance.last_modified_date,
      'is_active': instance.is_active,
      'is_deleted': instance.is_deleted,
      'subarea': instance.subarea,
      'discipline': instance.discipline,
      'emp_id': instance.emp_id,
      'region': instance.region,
      'date_of_retirement': instance.date_of_retirement
    };
