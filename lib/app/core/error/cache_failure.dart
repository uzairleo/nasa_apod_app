import 'package:nasa_apod_app/app/core/error/failure.dart';

class CacheFailure extends Failure {
  const CacheFailure(super.code, super.messages);

  @override
  List<Object?> get props => [];
}
