// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) =>
    ApiResponse<T>(
      results: (json['results'] as List<dynamic>?)
          ?.map(Converter<T>().fromJson)
          .toList(),
      resultCount: json['resultCount'] as int?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'results': instance.results?.map(Converter<T>().toJson).toList(),
      'resultCount': instance.resultCount,
    };
