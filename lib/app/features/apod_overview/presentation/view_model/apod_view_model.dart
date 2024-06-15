import 'dart:developer';

import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/Exception/exception_handler_services.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/usecase/fetch_apods_usecase.dart';
import 'package:nasa_apod_app/injection_container.dart';

class ApodViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Apod> filteredApods = <Apod>[].obs;
  final FetchApodsUsecase _fetchApods = locator<FetchApodsUsecase>();

  final ExceptionHandlerServices _exceptionHandler =
      locator<ExceptionHandlerServices>();
  ApodResponseModel? apodResponseModel;

  @override
  void onInit() async {
    await fetchAllApods();
    super.onInit();
  }

  Future<void> fetchAllApods() async {
    isLoading(true);
    final result = await _fetchApods(const ApodRequestPayload(
      count: "10",
    ));
    result.fold((failure) => _exceptionHandler.handleException(failure),
        (data) {
      apodResponseModel = data;
      filteredApods.value = data.apods;
    });
    log("Apods Response-> ${apodResponseModel?.toJson()}");
    isLoading(false);
  }

  void filterApods(String query) {
    if (query.isEmpty) {
      filteredApods.value = apodResponseModel?.apods ?? [];
    } else {
      filteredApods.value = apodResponseModel?.apods
              .where((apod) =>
                  apod.title!.toLowerCase().contains(query.toLowerCase()) ||
                  apod.date!.contains(query))
              .toList() ??
          [];
    }
  }
}
