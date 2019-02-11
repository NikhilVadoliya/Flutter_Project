import 'package:json_annotation/json_annotation.dart';
part 'signup_request.g.dart';
@JsonSerializable()
class SignUpRequest{
  String emp_id;
  String first_name;
  String last_name;
  String mobile;
  String email;
  String password;
  String designation;
  String gender;
  String official_address;
  String official_tel;
  String residential_address;
  String residential_tel;
  String subarea;
  String discipline;
  String region;
  int date_of_retirement;

  SignUpRequest(this.emp_id, this.first_name, this.last_name, this.mobile,
      this.email, this.password, this.designation, this.gender,
      this.official_address, this.official_tel, this.residential_address,
      this.residential_tel, this.subarea, this.discipline, this.region,
      this.date_of_retirement);

  factory SignUpRequest.fromJson(Map <String, dynamic> json) => _$SignUpRequestFromJson(json);


  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}