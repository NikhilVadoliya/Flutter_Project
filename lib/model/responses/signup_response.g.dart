// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) {
  return SignUpResponse(json['d'] == null
      ? null
      : UserData.fromJson(json['d'] as Map<String, dynamic>))
    ..s = json['s'] as bool
    ..e = json['e'] as int;
}

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{'s': instance.s, 'e': instance.e, 'd': instance.d};

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
      json['id'] as String,
      json['name'] as String,
      json['mobileNumber'] as String,
      json['email'] as String,
      json['status'] as int,
      json['verifiedOn'],
      json['approvedBy'],
      json['createdBy'] as String,
      json['createdDate'] as int,
      json['isActive'] as bool);
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'status': instance.status,
      'verifiedOn': instance.verifiedOn,
      'approvedBy': instance.approvedBy,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'isActive': instance.isActive
    };
