import 'package:app_demo/enum/training_enrollment_status.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tranining_data.g.dart';

@JsonSerializable()
class TrainingData {
  String id;
  String category_id;
  String partner_name;
  String training_code;
  String programmer_name;
  String level_of_participants_name;
  int start_date;
  int end_date;
  int reporting_time;
  String status;
  String description;
  int batch_size;
  int avg_rating;
  int enrolment_status;
  String course_coordinator;
  String created_by;
  int created_date;
  bool is_active;
  bool is_feedback_given;

  TrainingData(
      this.id,
      this.category_id,
      this.partner_name,
      this.training_code,
      this.programmer_name,
      this.level_of_participants_name,
      this.start_date,
      this.end_date,
      this.reporting_time,
      this.status,
      this.description,
      this.batch_size,
      this.avg_rating,
      this.enrolment_status,
      this.course_coordinator,
      this.created_by,
      this.created_date,
      this.is_active,
      this.is_feedback_given);

  bool isTrainingOpen() {
    return Utils.isBetweenDate(start_date, end_date);
  }

  bool isEnrolled() {
    enrolment_status == EnrollmentStatus.APPROVED.index;
  }

  factory TrainingData.fromJson(Map<String, dynamic> json) =>
      _$TrainingDataFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDataToJson(this);
}
