import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/core/exception/token_exception.dart';
import 'package:petadoption/injection_container.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final fss = sl<FlutterSecureStorage>();
    final token = await fss.read(key: storageToken);
    final typeToken = await fss.read(key: storageTypeToken);
    if (token == null && typeToken == null) {
    } else {
      options.headers.addAll({
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: "${typeToken!} ${token!}"
      });
    }

    if (kDebugMode) {
      print(
          '[Dio] Solicitud enviada: ${options.method} ${options.uri} - ${options.headers}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          '[Dio] Respuesta recibida: ${response.statusCode} ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          '[Dio] Error ocurrido: ${err.response?.statusCode} Mensaje: ${err.message} - ${err.response}');
    }
    if (err.response?.statusCode == 401) {
      if (kDebugMode) {
        throw const TokenException(
            "A problem has occurred, please log in again");
      }
    }
    super.onError(err, handler);
  }
}
