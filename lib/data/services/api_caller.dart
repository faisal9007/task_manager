import 'dart:convert';

import 'package:http/http.dart';

class ApiCaller {
  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);
      final int statusCode = response.statusCode;
      final decodedData = jsonDecode(response.body);

      if (statusCode == 200) {
        return ApiResponse(
          responseCode: statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return ApiResponse(
          responseCode: statusCode,
          isSuccess: false,
          responseData: decodedData,
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        isSuccess: false,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<ApiResponse> postRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);
      final int statusCode = response.statusCode;
      final decodedData = jsonDecode(response.body);

      if (statusCode == 200) {
        return ApiResponse(
          responseCode: statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return ApiResponse(
          responseCode: statusCode,
          isSuccess: false,
          responseData: decodedData,
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        isSuccess: false,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }
}

class ApiResponse {
  final int responseCode;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMessage;

  ApiResponse({
    required this.responseCode,
    required this.isSuccess,
    required this.responseData,
    this.errorMessage = 'Something Wrong',
  });
}
