import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/data_source/config_api_service.dart';
import 'package:petadoption/features/dashboard/data/models/config_model.dart';
import 'package:petadoption/features/dashboard/domain/repository/config_repository.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  ConfigRepositoryImpl(this._configApiService);
  final ConfigApiService _configApiService;
  @override
  Future<DataState<List<ConfigModel>>> getConfiguration() async {
    try {
      final httpResponse = await _configApiService.getConfigurations();
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
