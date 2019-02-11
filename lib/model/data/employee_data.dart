import 'package:json_annotation/json_annotation.dart';
part 'employee_data.g.dart';
@JsonSerializable()
class Employee {
  String id;
  String firstName;
  String lastName;
  String mobileNumber;
  String email;
  String gender;
  String eeGroup;
  String subgroup;
  String subarea;
  String discipline;
  var createdDate;
  String lastModifiedBy;
  var lastModifiedDate;
  bool isActive;
  bool isDeleted;
  int  dateOfRetirement;


  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  Employee(this.id, this.firstName, this.lastName, this.mobileNumber,
      this.email, this.gender, this.eeGroup, this.subgroup, this.subarea,
      this.discipline, this.createdDate, this.lastModifiedBy,
      this.lastModifiedDate, this.isActive, this.isDeleted,
      this.dateOfRetirement);

}
