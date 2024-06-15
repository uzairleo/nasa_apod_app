import 'package:fpdart/fpdart.dart';
import 'package:nasa_apod_app/app/core/Exception/exception.dart';
import 'package:nasa_apod_app/app/core/error/failure.dart';
import 'package:nasa_apod_app/app/core/error/server_failure.dart';
import 'package:nasa_apod_app/app/core/models/request/request.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/repository/apod_repository.dart';

import '../datasource/remote/apod_remote_datasource.dart';

class ApodRepositoryImpl implements ApodRepository {
  final ApodRemoteDatasource _remoteDatasource;

  ApodRepositoryImpl(
    this._remoteDatasource,
  );

  @override
  Future<Either<Failure, ApodResponseModel>> fetchApods(
      Request<ApodRequestPayload> request) async {
    try {
      return Right(await _remoteDatasource.fetchAllApods(request));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.code, e.messages));
    }
  }
}
