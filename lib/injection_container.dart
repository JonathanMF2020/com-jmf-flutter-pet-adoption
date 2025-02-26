import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:petadoption/config/flavors/app_config.dart';
import 'package:petadoption/core/dio/dio_interceptor.dart';
import 'package:petadoption/features/dashboard/data/data_source/dashboard_api_service.dart';
import 'package:petadoption/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:petadoption/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_animal_type.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_config.dart';
import 'package:petadoption/features/dashboard/domain/usecases/logout.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/animal_type/animal_type_bloc.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/config/config_bloc.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/pet/pet_bloc.dart';
import 'package:petadoption/features/home/data/data_source/home_storage_service.dart';
import 'package:petadoption/features/home/data/repository/home_repository_impl.dart';
import 'package:petadoption/features/home/domain/repository/home_repository.dart';
import 'package:petadoption/features/home/domain/usecases/get_account.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_pets.dart';
import 'package:petadoption/features/home/presentation/bloc/account/account_bloc.dart';
import 'package:petadoption/features/login/data/data_source/remote/login_api_service.dart';
import 'package:petadoption/features/login/data/repository/login_repository_impl.dart';
import 'package:petadoption/features/login/domain/repository/login_repository.dart';
import 'package:petadoption/features/login/domain/usecases/login.dart';
import 'package:petadoption/features/login/presentation/bloc/login_bloc.dart';
import 'package:petadoption/features/register/data/data_source/remote/register/register_api_service.dart';
import 'package:petadoption/features/register/data/repository/register_repository_impl.dart';
import 'package:petadoption/features/register/domain/repository/register_repository.dart';
import 'package:petadoption/features/register/domain/usecases/register.dart';
import 'package:petadoption/features/register/presentation/bloc/register_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio(BaseOptions(baseUrl: AppConfig.shared.apiBaseURL));
  dio.interceptors.add(DioInterceptor());
  sl.registerSingleton<Dio>(dio);

  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  sl.registerSingleton<FlutterSecureStorage>(secureStorage);
  //Data sources
  // APIS
  sl.registerSingleton<RegisterApiService>(RegisterApiService(sl()));
  sl.registerSingleton<LoginApiService>(LoginApiService(sl()));
  sl.registerSingleton<DashboardApiService>(DashboardApiService(sl()));
  // STORAGE
  sl.registerSingleton<HomeStorageService>(HomeStorageService(sl()));

  //Repositories
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  //Use cases
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => GetConfig(sl()));
  sl.registerLazySingleton(() => GetAccount(sl()));
  sl.registerLazySingleton(() => GetPets(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => GetAnimalType(sl()));

  //Blocs
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => ConfigBloc(sl()));
  sl.registerFactory(() => AccountBloc(sl()));
  sl.registerFactory(() => PetBloc(sl(), sl()));
  sl.registerFactory(() => AnimalTypeBloc(sl(), sl()));
}
