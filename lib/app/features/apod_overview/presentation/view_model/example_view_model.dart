import 'package:get/get.dart';

class ExampleViewModel extends GetxController {
  RxBool isLoading = false.obs;

  showLoading(value) {
    isLoading.value = value;
    update();
  }
}
