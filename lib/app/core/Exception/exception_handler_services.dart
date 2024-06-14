import 'package:nasa_apod_app/app/core/error/failure.dart';

abstract class ExceptionHandlerServices {
  handleException(Failure failure);
}
