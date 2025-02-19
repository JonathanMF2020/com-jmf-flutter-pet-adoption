import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:petadoption/core/resources/data_state.dart';

Future<DataState<T>> handleRequest<T>(Future<HttpResponse<T>> request) async {
  try {
    final httpResponse = await request;
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(
        DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
        ),
      );
    }
  } catch (e) {
    rethrow; // Allow callers to see the exception.
  }
}
