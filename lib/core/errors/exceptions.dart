import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  const APIException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
