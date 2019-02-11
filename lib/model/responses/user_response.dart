import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/data/require_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';
@JsonSerializable()
class UserResponse extends BaseResponse {
  UserDataProfile d;

  UserResponse(bool s, int e) : super(s, e);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}

@JsonSerializable()
class UserDataProfile {
  Attendee attendee;
  List<RequireData> regions;

  UserDataProfile(this.attendee, this.regions);

  factory UserDataProfile.fromJson(Map<String, dynamic> json) =>
      _$UserDataProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataProfileToJson(this);
}

@JsonSerializable()
class Attendee {
  String id;
  String first_name;
  String last_name;
  String designation;
  String mobile_number;
  String email;
  String gender;
  String official_address;
  String official_tel;
  String residential_address;
  String residential_tel;
  String user_id;
  int created_date;
  String last_modified_by;
  int last_modified_date;
  bool is_active;
  bool is_deleted;
  String subarea;
  String discipline;
  String emp_id;
  String region;
  int date_of_retirement;

  Attendee(this.id, this.first_name, this.last_name, this.designation,
      this.mobile_number, this.email, this.gender, this.official_address,
      this.official_tel, this.residential_address, this.residential_tel,
      this.user_id, this.created_date, this.last_modified_by,
      this.last_modified_date, this.is_active, this.is_deleted, this.subarea,
      this.discipline, this.emp_id, this.region, this.date_of_retirement);

  factory Attendee.fromJson(Map<String, dynamic> json) =>
      _$AttendeeFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeToJson(this);
}
