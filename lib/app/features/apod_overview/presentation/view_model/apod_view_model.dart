import 'dart:developer';

import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/Exception/exception_handler_services.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/usecase/fetch_apods_usecase.dart';
import 'package:nasa_apod_app/injection_container.dart';

class ApodViewModel extends GetxController {
  RxBool isLoading = false.obs;
  final FetchApodsUsecase _fetchApods = locator<FetchApodsUsecase>();

  final ExceptionHandlerServices _exceptionHandler =
      locator<ExceptionHandlerServices>();
  ApodResponseModel? apodResponseModel;

  Future<void> fetchRegistrant() async {
    isLoading(true);
    final result = await _fetchApods(
        const ApodRequestPayload(startDate: "startDate", endDate: "endDate"));
    result.fold((failure) => _exceptionHandler.handleException(failure),
        (data) {
      apodResponseModel = data;
    });
    log("Apods Response-> ${apodResponseModel?.toJson()}");
    isLoading(false);
  }
}
