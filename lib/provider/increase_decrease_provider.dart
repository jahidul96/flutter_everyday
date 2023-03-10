import 'package:flutter/cupertino.dart';

class IncreaseDecreaseProvider extends ChangeNotifier {
  int number = 0;

  void increase() {
    number++;
    notifyListeners();
  }

  void decrease() {
    number--;
    notifyListeners();
  }
}
