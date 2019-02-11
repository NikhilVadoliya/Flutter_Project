import 'package:app_demo/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';
@JsonSerializable()
class SignUpResponse extends BaseResponse{
  
  UserData d;

  SignUpResponse( this.d) : super(false, 0);

  factory SignUpResponse.fromJson(Map <String, dynamic> json) => _$SignUpResponseFromJson(json);


  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

@JsonSerializable()
class UserData {
  String id;
  String name;
  String mobileNumber;
  String email;
  int status;
  Object verifiedOn;
  Object approvedBy;
  String createdBy;
  int createdDate;
  bool isActive;

  UserData(this.id, this.name, this.mobileNumber, this.email, this.status,
      this.verifiedOn, this.approvedBy, this.createdBy, this.createdDate,
      this.isActive);

  factory UserData.fromJson(Map <String, dynamic> json) => _$UserDataFromJson(json);


  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
