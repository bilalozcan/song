import 'package:json_annotation/json_annotation.dart';

import '../song/song.dart';

class Converter<T> implements JsonConverter<T, Object?> {
  const Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      case Song:
        return Song.fromJson(json as Map<String, dynamic>) as T;
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}
