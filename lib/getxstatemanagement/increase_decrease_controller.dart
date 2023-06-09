import 'package:get/get.dart';

class IncreaseDecreaseController extends GetxController {
  var number = 0.obs;

  increase() {
    number++;
  }

  decrease() {
    number--;
  }
}
