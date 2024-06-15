import 'package:get/get.dart';

class ApodViewModel extends GetxController {
  RxBool isLoading = false.obs;

  showLoading(value) {
    isLoading.value = value;
    update();
  }
}
