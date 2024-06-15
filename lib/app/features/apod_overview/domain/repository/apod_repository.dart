import 'package:fpdart/fpdart.dart';
import 'package:nasa_apod_app/app/core/error/failure.dart';
import 'package:nasa_apod_app/app/core/models/request/request.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';

abstract class ApodRepository {
  Future<Either<Failure, ApodResponseModel>> fetchApods(
      Request<ApodRequestPayload> request);
}
