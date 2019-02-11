import 'package:json_annotation/json_annotation.dart';
part 'training_list_request.g.dart';

@JsonSerializable()
class TrainingListRequest {

  Filter filters;
  String searchQuery;

  TrainingListRequest(this.filters, this.searchQuery);

  factory TrainingListRequest.fromJson(Map<String, dynamic> json) =>
      _$TrainingListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingListRequestToJson(this);
}

@JsonSerializable()
class Filter {
  List<String> organization;
  List<String> category;
  List<String> trainingMonth;
  List<String> levelOfParticipants;

  Filter(this.organization, this.category, this.trainingMonth,
      this.levelOfParticipants);


  factory Filter.fromJson(Map<String, dynamic> json) =>
      _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}
