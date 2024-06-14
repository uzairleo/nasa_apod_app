import 'package:get/get.dart';

class EnableFaceIdViewModel extends GetxController {
  RxBool isLoading = false.obs;

  showLoading(value) {
    isLoading.value = value;
    update();
  }
}
