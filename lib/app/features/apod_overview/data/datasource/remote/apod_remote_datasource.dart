import 'package:nasa_apod_app/app/core/constants/config.dart';
import 'package:nasa_apod_app/app/core/constants/urls.dart';
import 'package:nasa_apod_app/app/core/httpClient/dio_service.dart';
import 'package:nasa_apod_app/app/core/models/request/request.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';

abstract class ApodRemoteDatasource {
  Future<ApodResponseModel> fetchAllApods(Request<ApodRequestPayload> request);
}

class ApodRemoteDatasourceImpl implements ApodRemoteDatasource {
  final DioServices _dioClient;

  ApodRemoteDatasourceImpl(this._dioClient);

  @override
  Future<ApodResponseModel> fetchAllApods(
      Request<ApodRequestPayload> request) async {
    final data = await _dioClient.get(Urls.getApods, queryParameters: {
      "api_key": Config.NASA_API_KEY,
      "count": request.data.count,
    });
    return ApodResponseModel.fromJson(data ?? {});
  }
}
