import 'package:app_demo/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'updated_profile_response.g.dart';
@JsonSerializable()
class UpdateProfileResponse  extends BaseResponse {

  UpdatedProfile d;

  UpdateProfileResponse(bool s, int e) : super(s, e);

  factory UpdateProfileResponse.fromJson(Map <String, dynamic> json) => _$UpdateProfileResponseFromJson(json);


  Map<String, dynamic> toJson() => _$UpdateProfileResponseToJson(this);

}
@JsonSerializable()
class UpdatedProfile {
  String id;
  String first_name;
  String last_name;
  String designation;
  String mobile_number;
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

  UpdatedProfile(this.id, this.first_name, this.last_name,
      this.designation, this.mobile_number, this.gender, this.official_address,
      this.official_tel, this.residential_address, this.residential_tel,
      this.user_id, this.created_date, this.last_modified_by,
      this.last_modified_date, this.is_active, this.is_deleted, this.subarea,
      this.discipline, this.emp_id, this.region, this.date_of_retirement);

  factory UpdatedProfile.fromJson(Map <String, dynamic> json) => _$UpdatedProfileFromJson(json);


  Map<String, dynamic> toJson() => _$UpdatedProfileToJson(this);
}
