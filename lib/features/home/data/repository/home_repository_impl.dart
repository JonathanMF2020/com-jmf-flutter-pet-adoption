import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/home/data/data_source/home_api_service.dart';
import 'package:petadoption/features/home/data/data_source/home_storage_service.dart';
import 'package:petadoption/features/dashboard/data/models/pet_model.dart';
import 'package:petadoption/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeStorageService, this._homeApiService);
  final HomeStorageService _homeStorageService;
  final HomeApiService _homeApiService;

  @override
  Future<DataState<List<String>>> getAccount() async {
    final data = await _homeStorageService.getAccount();
    return DataSuccess(data);
  }

  @override
  Future<DataState<List<PetModel>>> getPets() async {
    try {
      final data = await _homeApiService.getPets();
      if (data.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: data.response.requestOptions,
            response: data.response,
            error: data.response.statusMessage,
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
