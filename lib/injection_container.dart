import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_apod_app/app/core/Exception/exception_handler_impl.dart';
import 'package:nasa_apod_app/app/core/Exception/exception_handler_services.dart';
import 'package:nasa_apod_app/app/core/cacheStorage/cache_storage_service.dart';
import 'package:nasa_apod_app/app/core/httpClient/api_response_handler.dart';
import 'package:nasa_apod_app/app/core/httpClient/dio_implementation.dart';
import 'package:nasa_apod_app/app/core/httpClient/dio_service.dart';
import 'package:nasa_apod_app/app/core/utilities/authenticator.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/datasource/remote/apod_remote_datasource.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/repository/apod_repository_impl.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/repository/apod_repository.dart';
import 'package:nasa_apod_app/app/features/apod_overview/domain/usecase/fetch_apods_usecase.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  /// **************** NASA APODS ******************
  locator.registerLazySingleton<ApodRemoteDatasource>(
      () => ApodRemoteDatasourceImpl(locator()));
  locator.registerLazySingleton<ApodRepository>(
      () => ApodRepositoryImpl(locator()));
  locator.registerLazySingleton(() => FetchApodsUsecase(locator()));
  // *************************************************

  /// **************** DIO CLIENT ******************
  locator.registerLazySingleton<DioServices>(
    () => DioClient(
      dio: locator(),
      apiResponseHandler: locator(),
      authenticator: locator(),
    ),
  );
  locator.registerLazySingleton<ApiResponseHandlerServices>(
      () => ApiResponseHandler());
  locator.registerSingleton(Authenticator());
  locator.registerLazySingleton(() => Dio());
// *************************************************

//  **************** Utils ******************
  locator.registerSingleton<ExceptionHandlerServices>(ExceptionHandlerImpl());
// *************************************************

//  **************** LocalStorageService ******************
  locator.registerSingleton(await CacheStorageService.create());
// *************************************************
}
