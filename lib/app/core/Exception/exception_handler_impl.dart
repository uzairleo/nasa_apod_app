import 'package:get/get.dart';
import 'package:nasa_apod_app/app/core/Exception/exception_handler_services.dart';
import 'package:nasa_apod_app/app/core/error/dialog/error_dialog.dart';
import 'package:nasa_apod_app/app/core/error/failure.dart';

class ExceptionHandlerImpl implements ExceptionHandlerServices {
  ExceptionHandlerImpl();

  @override
  handleException(Failure f) {
    Get.back();
    if (f.code == "403") {}
    Get.dialog(ErrorDialog(title: "Error ${f.code}", message: f.messages.first),
        barrierDismissible: false);
  }
}
