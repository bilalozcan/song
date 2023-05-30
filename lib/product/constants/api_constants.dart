enum ApiEndoints { search }

extension ApiEndointsExtension on ApiEndoints {
  String get rawValue {
    switch (this) {
      case ApiEndoints.search:
        return 'search';
    }
  }
}

enum ApiFields { term, limit, offset }

String kSearchKeyword = 'jack+johnson';
