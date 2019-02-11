// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_r.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginR _$LoginRFromJson(Map<String, dynamic> json) {
  return LoginR(json['s'] as bool, json['e'] as int)
    ..d = json['d'] == null
        ? null
        : LoginResponse.fromJson(json['d'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginRToJson(LoginR instance) =>
    <String, dynamic>{'s': instance.s, 'e': instance.e, 'd': instance.d};
