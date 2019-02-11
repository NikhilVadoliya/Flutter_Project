// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tranining_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingData _$TrainingDataFromJson(Map<String, dynamic> json) {
  return TrainingData(
      json['id'] as String,
      json['category_id'] as String,
      json['partner_name'] as String,
      json['training_code'] as String,
      json['programmer_name'] as String,
      json['level_of_participants_name'] as String,
      json['start_date'] as int,
      json['end_date'] as int,
      json['reporting_time'] as int,
      json['status'] as String,
      json['description'] as String,
      json['batch_size'] as int,
      json['avg_rating'] as int,
      json['enrolment_status'] as int,
      json['course_coordinator'] as String,
      json['created_by'] as String,
      json['created_date'] as int,
      json['is_active'] as bool,
      json['is_feedback_given'] as bool);
}

Map<String, dynamic> _$TrainingDataToJson(TrainingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'partner_name': instance.partner_name,
      'training_code': instance.training_code,
      'programmer_name': instance.programmer_name,
      'level_of_participants_name': instance.level_of_participants_name,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'reporting_time': instance.reporting_time,
      'status': instance.status,
      'description': instance.description,
      'batch_size': instance.batch_size,
      'avg_rating': instance.avg_rating,
      'enrolment_status': instance.enrolment_status,
      'course_coordinator': instance.course_coordinator,
      'created_by': instance.created_by,
      'created_date': instance.created_date,
      'is_active': instance.is_active,
      'is_feedback_given': instance.is_feedback_given
    };
