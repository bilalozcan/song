import 'package:json_annotation/json_annotation.dart';

import 'converter.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> {
  ApiResponse({this.results, this.resultCount});

  @Converter()
  List<T>? results;
  int? resultCount;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
