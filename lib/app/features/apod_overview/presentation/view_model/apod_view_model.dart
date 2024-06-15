import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:nasa_apod_app/app/core/Exception/exception_handler_services.dart';
import 'package:nasa_apod_app/app/core/cacheStorage/cache_storage_service.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/request/apod_request_payload.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/usecase/fetch_apods_usecase.dart';
import 'package:nasa_apod_app/injection_container.dart';

class ApodViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isFabVisible = false.obs;
  RxList<Apod> apods = <Apod>[].obs;
  RxList<Apod> filteredApods = <Apod>[].obs;
  final FetchApodsUsecase _fetchApods = locator<FetchApodsUsecase>();
  final CacheStorageService _localStorageService =
      locator<CacheStorageService>();

  final ExceptionHandlerServices _exceptionHandler =
      locator<ExceptionHandlerServices>();
  ApodResponseModel? apodResponseModel;
  int currentPage = 1;
  static const int pageSize = 10;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    scrollController.addListener(_scrollListener);
    await fetchApods(page: currentPage);
    super.onInit();
  }

  Future<void> fetchApods({required int page, bool isRefresh = false}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (page == 1 || isRefresh) {
      isLoading(true);
      if (isRefresh) currentPage = 1; // Reset the current page if refreshing
    } else {
      isLoadingMore(true);
    }

    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection, load from cache
      final cachedData = _localStorageService.getCachedApods();
      apods.value = cachedData;
      filteredApods.value = apods;
    } else {
      // Fetch from API
      final result =
          await _fetchApods(const ApodRequestPayload(count: "$pageSize"));
      result.fold(
        (failure) => _exceptionHandler.handleException(failure),
        (data) {
          apodResponseModel = data;
          if (page == 1 || isRefresh) {
            apods.value = data.apods;
            filteredApods.value = data.apods;
            _localStorageService
                .cacheApods(data.apods); // Cache the first 10 items
          } else {
            apods.addAll(data.apods);
            filteredApods.addAll(data.apods);
          }
        },
      );

      log("Apods Response-> ${apodResponseModel?.toJson()}");
    }

    if (page == 1 || isRefresh) {
      isLoading(false);
    } else {
      isLoadingMore(false);
    }
  }

  Future<void> loadMore() async {
    currentPage++;
    await fetchApods(page: currentPage);
  }

  void filterApods(String query) {
    if (query.isEmpty) {
      filteredApods.value = apods;
    } else {
      filteredApods.value = apods
          .where((apod) =>
              apod.title!.toLowerCase().contains(query.toLowerCase()) ||
              apod.date!.contains(query))
          .toList();
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels > 200) {
      isFabVisible(true);
    } else {
      isFabVisible(false);
    }
  }
}
