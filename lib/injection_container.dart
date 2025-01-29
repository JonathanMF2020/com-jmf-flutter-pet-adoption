import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:petadoption/core/dio/dio_interceptor.dart';
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

  //Data sources
  sl.registerSingleton<RegisterApiService>(RegisterApiService(sl()));
  sl.registerSingleton<LoginApiService>(LoginApiService(sl()));

  //Repositories
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));

  //Use cases
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  //Blocs
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
}
