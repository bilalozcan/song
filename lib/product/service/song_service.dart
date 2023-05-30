import 'package:song/product/constants/product_constants.dart';

import '../../core/models/simple_result.dart';
import '../constants/api_constants.dart';
import '../manager/network_manager.dart';
import '../models/api/api_response.dart';
import '../models/song/song.dart';

class SongService {
  static SongService? _instance;
  static SongService get instance {
    _instance ??= SongService._init();
    return _instance!;
  }

  SongService._init();

  Future<SimpleResult<List<Song>>> getSongs({int? offset, bool isLimit = false}) async {
    try {
      SimpleResult<ApiResponse<Song>> apiResponse = await NetworkManager.instance.request<Song>(
        RequestType.get,
        ApiEndoints.search.rawValue,
        queryParameters: {
          ApiFields.term.name: kSearchKeyword,
          if(isLimit) ApiFields.limit.name: ProductConstants.instance.perPage,
          ApiFields.offset.name: offset,
        },
      );
      if (apiResponse.isSuccess) {
        return SimpleResult(isSuccess: true, data: apiResponse.data!.results!.map((e) => e).toList());
      }
      return SimpleResult(isSuccess: false);
    } catch (e) {
      return SimpleResult(isSuccess: false);
    }
  }
}
