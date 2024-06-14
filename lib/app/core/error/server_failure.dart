import 'package:nasa_apod_app/app/core/error/failure.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.code, super.messages);

  @override
  List<Object?> get props => [];
}
