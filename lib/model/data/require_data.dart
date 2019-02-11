import 'package:json_annotation/json_annotation.dart';
part 'require_data.g.dart';
@JsonSerializable()
class RequireData {
  String id;
  String text;

  RequireData(this.id, this.text);

  factory RequireData.fromJson(Map<String, dynamic> json) =>
      _$RequireDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequireDataToJson(this);
}
