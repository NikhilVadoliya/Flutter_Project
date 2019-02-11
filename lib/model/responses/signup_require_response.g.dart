// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_require_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequireDataResponse _$RequireDataResponseFromJson(Map<String, dynamic> json) {
  return RequireDataResponse(json['d'] == null
      ? null
      : RequireD.fromJson(json['d'] as Map<String, dynamic>))
    ..s = json['s'] as bool
    ..e = json['e'] as int;
}

Map<String, dynamic> _$RequireDataResponseToJson(
        RequireDataResponse instance) =>
    <String, dynamic>{'s': instance.s, 'e': instance.e, 'd': instance.d};

RequireD _$RequireDFromJson(Map<String, dynamic> json) {
  return RequireD((json['regions'] as List)
      ?.map((e) =>
          e == null ? null : RequireData.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$RequireDToJson(RequireD instance) =>
    <String, dynamic>{'regions': instance.regions};
