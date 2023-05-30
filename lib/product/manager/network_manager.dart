import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../../core/models/simple_result.dart';
import '../constants/product_constants.dart';
import '../models/api/api_response.dart';

enum RequestType { get, post, put, delete, patch }

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: ProductConstants.instance.baseUrl,
        contentType: 'application/json',
        // headers: {'Authorization': 'Bearer ${ProductConstants.instance.apiToken}'},
        ),
  );

  Future<SimpleResult<ApiResponse<T>>> request<T>(
    RequestType requestType,
    String path, {
    dynamic data,
    dynamic model,
    Map<String, dynamic>? queryParameters,
    bool isBaseResponse = true,
    isFile = false,
  }) async {
    var time = DateTime.now();
    data ??= {};
    try {
      Object? body = data is Map || data is FormData ? data : data.toJson();

      var response = await _dio.request(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          contentType: isFile ? 'multipart/form-data' : 'application/json',
          method: requestType.name,
        ),
      );

      if (kDebugMode) {
        print('$path -> ${(DateTime.now().difference(time)).inMilliseconds} ms');
      }
      if (response.statusCode == 200) {
        var dataBody = jsonDecode(response.data);
        return SimpleResult(isSuccess: true, data: ApiResponse<T>.fromJson(dataBody));
        // return SimpleResult(isSuccess: true, data: (T as Converter).fromJson(response.data));
        // if (isBaseResponse) {
        //   return _baseResponseConverter(response.data, model: model);
        // } else {
        //   return model.fromJson(response.data);
        // }
      } else {
        return _showError<T>(
          '$path ${requestType.name}',
          'Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}',
          response.data,
          time,
        );
      }
    } on DioError catch (dioError) {
      return _showError<T>(
        '$path ${requestType.name}',
        'Error: ${dioError.error} | Status Message: ${dioError.message}',
        dioError.response!.data,
        time,
      );
    } catch (error) {
      return _showError(
        '$path ${requestType.name}',
        error,
        null,
        time,
      );
    }
  }

  SimpleResult<ApiResponse<T>> _showError<T>(
    String errorPoint,
    dynamic error,
    dynamic responseData,
    DateTime time,
  ) {
    // ignore: unused_local_variable
    String? message;
    if (responseData != null) {
      if (responseData == '') {
        message = 'Sunucu ile ilgili bir hata oluştu. Lütfen daha sonra tekrar deneyiniz';
      } else {
        message = responseData!['message'];
      }
    }
    log('$errorPoint FAILED | Status Code: $error');
    print('$errorPoint -> ${(DateTime.now().difference(time)).inMilliseconds} ms');
    // if (message != null) Fluttertoast.showToast(msg: message);
    return SimpleResult(isSuccess: false);
  }

  // dynamic _baseResponseConverter<T extends BaseModel>(dynamic data, {T? model}) {
  //   final baseResponse = BaseResponse.fromJson(data);
  //   if (baseResponse.success!) {
  //     if (baseResponse.data != null) {
  //       if (model is EmptyModel) {
  //         return baseResponse.data;
  //       }
  //       if (baseResponse.data is List) {
  //         var list = <T>[];
  //         (baseResponse.data as List).forEach((element) => list.add(model!.fromJson(element)));
  //         return list;
  //       } else {
  //         return model!.fromJson(baseResponse.data as Map<String, dynamic>);
  //       }
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
}
