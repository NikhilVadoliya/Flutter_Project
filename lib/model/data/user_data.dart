import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class USerData {
  String id;
  String name;
  String mobileNumber;
  String email;
  int status;
  Object verifiedOn;
  Object approvedBy;
  String createdBy;
  var createdDate;
  bool isActive;

  USerData(this.id, this.name, this.mobileNumber, this.email, this.status,
      this.verifiedOn, this.approvedBy, this.createdBy, this.createdDate,
      this.isActive);

  factory USerData.fromJson(Map<String, dynamic> json) =>
      _$USerDataFromJson(json);

  Map<String, dynamic> toJson() => _$USerDataToJson(this);
}
