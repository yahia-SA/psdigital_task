import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:psdigital_task/core/network/dio_consumer.dart';
import 'package:psdigital_task/features/menu/presentation/cubit/cart_cubit.dart';
import 'package:psdigital_task/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:psdigital_task/features/menu/data/datasources/menu_data_source.dart';
import 'package:psdigital_task/features/menu/data/repositories/menu_repo_impl.dart';
import 'package:psdigital_task/features/menu/domain/repositories/menu_repository.dart';
import 'package:psdigital_task/features/menu/domain/usecases/menu_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Register DioHelper
  sl.registerLazySingleton<Dio>(() => Dio()); // register Dio first

  sl.registerLazySingleton<DioConsumer>(
    () => DioConsumer(client: sl<Dio>()),
  );

  // Register Data Sources
  sl.registerLazySingleton<MenuRemoteDataSource>(
    () => MenuRemoteDataSourceImpl(client: sl<DioConsumer>()),
  );

  // Register Repositories
  sl.registerLazySingleton<MenuRepository>(
    () => MenuRepositoryImpl(remoteDataSource: sl<MenuRemoteDataSource>()),
  );
  // Register Use Cases
  sl.registerLazySingleton(() => MenuUsecase(sl<MenuRepository>()));

  // Register Cubit
  sl.registerFactory(() => MenuCubit(menuUsecase: sl<MenuUsecase>()));
  sl.registerFactory(() => CartCubit());
}
