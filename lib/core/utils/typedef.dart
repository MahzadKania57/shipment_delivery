import 'package:dartz/dartz.dart';
import 'package:shipment_delivery/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
