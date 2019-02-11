import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/data/tranining_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'traninig_list_response.g.dart';
@JsonSerializable()
class TrainingListResponse extends BaseResponse{
  List<TrainingData> d;


  TrainingListResponse(bool s, int e) : super(s, e);

  factory TrainingListResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingListResponseToJson(this);
}
