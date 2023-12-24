import 'package:get_it/get_it.dart';
import 'package:shipment_delivery/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:shipment_delivery/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:shipment_delivery/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:shipment_delivery/features/authentication/domain/usecases/authentication_usecases.dart';
import 'package:shipment_delivery/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:shipment_delivery/features/deliveries/data/data_sources/deliveries_data_source.dart';
import 'package:shipment_delivery/features/deliveries/data/repositories/deliveries_repository_impl.dart';
import 'package:shipment_delivery/features/deliveries/domain/repositories/deliveries_repository.dart';
import 'package:shipment_delivery/features/deliveries/domain/usecases/deliveries_usecases.dart';
import 'package:http/http.dart' as http;
import 'package:shipment_delivery/features/deliveries/presentation/cubit/deliveries_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await loginInit();
  await getDeliveryInit();
}

Future<void> loginInit() async {
  sl
    ..registerFactory(() => AuthBloc(signIn: sl()))
    ..registerLazySingleton(() => AuthenticationUseCase(sl()))
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(sl()))
    ..registerLazySingleton<AuthenticationDataSource>(
        () => AuthenticationDataSourceImpl(sl()))
    ..registerLazySingleton(() => http.Client);
}

Future<void> getDeliveryInit() async {
  sl
    ..registerFactory(() => DeliveriesCubit(
          getDeliveries: sl(),
        ))
    ..registerLazySingleton(() => DeliveriesUseCase(sl()))
    ..registerLazySingleton<DeliveriesRepository>(
        () => DeliveriesRepositoryImpl(sl()))
    ..registerLazySingleton<DeliveriesDataSource>(
        () => DeliveriesDataSourceImpl(sl()))
    ..registerLazySingleton(() => http.Client());
}
