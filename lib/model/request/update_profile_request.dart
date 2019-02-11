import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request.g.dart';
@JsonSerializable()
class UpdateProfileRequest {
  String id;
  String first_name;
  String last_name;
  String region;
  String designation;
  String subarea;
  String discipline;
  int date_of_retirement;
  String official_address;
  String official_tel;
  String residential_address;
  String residential_tel;
  String gender;

  UpdateProfileRequest(this.id, this.first_name, this.last_name, this.region,
      this.designation, this.subarea, this.discipline, this.date_of_retirement,
      this.official_address, this.official_tel, this.residential_address,
      this.residential_tel, this.gender);

  factory UpdateProfileRequest.fromJson(Map <String, dynamic> json) => _$UpdateProfileRequestFromJson(json);


  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
