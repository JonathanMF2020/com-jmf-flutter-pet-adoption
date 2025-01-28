import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:petadoption/core/dio/dio_interceptor.dart';
import 'package:petadoption/features/register/data/data_source/remote/register/register_api_service.dart';
import 'package:petadoption/features/register/data/repository/register_repository_impl.dart';
import 'package:petadoption/features/register/domain/repository/register_repository.dart';
import 'package:petadoption/features/register/domain/usecases/register_use_case.dart';
import 'package:petadoption/features/register/presentation/bloc/register_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(DioInterceptor());
  sl.registerSingleton<Dio>(dio);

  //Data sources
  sl.registerSingleton<RegisterApiService>(RegisterApiService(sl()));

  //Repositories
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(sl()));

  //Use cases
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  //Blocs
  sl.registerFactory(() => RegisterBloc(sl()));
}
