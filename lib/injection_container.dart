import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:petadoption/core/dio/dio_interceptor.dart';
import 'package:petadoption/features/dashboard/data/data_source/config_api_service.dart';
import 'package:petadoption/features/dashboard/data/repository/config_repository_impl.dart';
import 'package:petadoption/features/dashboard/domain/repository/config_repository.dart';
import 'package:petadoption/features/dashboard/domain/usecases/config_use_cases.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:petadoption/features/home/data/data_source/home_storage_service.dart';
import 'package:petadoption/features/home/data/repository/home_repository_impl.dart';
import 'package:petadoption/features/home/domain/repository/home_repository.dart';
import 'package:petadoption/features/home/domain/usecases/home_use_case.dart';
import 'package:petadoption/features/home/presentation/bloc/home_bloc.dart';
import 'package:petadoption/features/login/data/data_source/remote/login_api_service.dart';
import 'package:petadoption/features/login/data/repository/login_repository_impl.dart';
import 'package:petadoption/features/login/domain/repository/login_repository.dart';
import 'package:petadoption/features/login/domain/usecases/login_use_case.dart';
import 'package:petadoption/features/login/presentation/bloc/login_bloc.dart';
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

  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  sl.registerSingleton<FlutterSecureStorage>(secureStorage);
  //Data sources
  sl.registerSingleton<RegisterApiService>(RegisterApiService(sl()));
  sl.registerSingleton<LoginApiService>(LoginApiService(sl()));
  sl.registerSingleton<ConfigApiService>(ConfigApiService(sl()));

  sl.registerSingleton<HomeStorageService>(HomeStorageService(sl()));

  //Repositories
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<ConfigRepository>(() => ConfigRepositoryImpl(sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  //Use cases
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => ConfigUseCase(sl()));
  sl.registerLazySingleton(() => HomeUseCase(sl()));

  //Blocs
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => DashboardBloc(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
}
