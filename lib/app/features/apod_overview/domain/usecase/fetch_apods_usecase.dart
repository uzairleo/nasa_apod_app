import 'package:fpdart/fpdart.dart';
import 'package:nasa_apod_app/app/core/error/failure.dart';
import 'package:nasa_apod_app/app/core/models/request/request.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/repository/apod_repository.dart';

class FetchApodsUsecase {
  final ApodRepository _repository;

  FetchApodsUsecase(this._repository);

  Future<Either<Failure, ApodResponseModel>> call(
      ApodRequestPayload request) async {
    return await _repository.fetchApods(Request(request));
  }
}
