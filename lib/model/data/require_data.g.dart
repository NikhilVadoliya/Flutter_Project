

part of 'require_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequireData _$RequireDataFromJson(Map<String, dynamic> json) {
  return RequireData(json['id'] as String, json['text'] as String);
}

Map<String, dynamic> _$RequireDataToJson(RequireData instance) =>
    <String, dynamic>{'id': instance.id, 'text': instance.text};
