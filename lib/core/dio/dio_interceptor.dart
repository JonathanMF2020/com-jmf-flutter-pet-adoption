import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Content-Type': 'application/json',
    });

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
        print('[Dio] Sesión expirada. Redirigir al inicio de sesión.');
      }
    }
    super.onError(err, handler);
  }
}
