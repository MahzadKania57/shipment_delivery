import 'package:get_it/get_it.dart';
import 'package:shipment_delivery/features/deliveries/data/data_sources/deliveries_data_source.dart';
import 'package:shipment_delivery/features/deliveries/data/repositories/deliveries_repository_impl.dart';
import 'package:shipment_delivery/features/deliveries/domain/repositories/deliveries_repository.dart';
import 'package:shipment_delivery/features/deliveries/domain/usecases/deliveries_usecases.dart';
import 'package:http/http.dart' as http;
import 'package:shipment_delivery/features/deliveries/presentation/cubit/deliveries_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //App Logic
    ..registerFactory(() => DeliveriesCubit(
          getDeliveries: sl(),
        ))

    //Use Cases
    ..registerLazySingleton(() => DeliveriesUseCase(sl()))

    //Repositories
    ..registerLazySingleton<DeliveriesRepository>(
        () => DeliveriesRepositoryImpl(sl()))

    //Data Sources
    ..registerLazySingleton<DeliveriesDataSource>(
        () => DeliveriesDataSourceImpl(sl()))

    //External Dependencies
    ..registerLazySingleton(() => http.Client());
}
