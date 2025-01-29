import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/login/data/data_source/remote/login_api_service.dart';
import 'package:petadoption/features/login/data/models/dto/login_dto.dart';
import 'package:petadoption/features/login/data/models/login_model.dart';
import 'package:petadoption/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._loginApiService);
  final LoginApiService _loginApiService;

  @override
  Future<DataState<LoginModel>> register(LoginDto logindto) async {
    try {
      final httpResponse = await _loginApiService.login(
          "password", logindto.username, logindto.password, "application/json");
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
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrintStack(stackTrace: e.stackTrace);
      }
      return DataFailed(e);
    }
  }
}
