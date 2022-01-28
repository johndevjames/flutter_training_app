import 'package:flutter/material.dart';

class SelectFilterNotifier extends ValueNotifier<int>  {
  SelectFilterNotifier(int value) : super(value);

  void changeFilter(int item) {
    value = item;
    notifyListeners();
  }

}

class SelectLocationCheckBoxNotifier extends ValueNotifier<bool>  {
  SelectLocationCheckBoxNotifier(bool value) : super(value);

  void changeCheckBox(bool item) {
    value = item;
    notifyListeners();
  }

}
class SelectNameCheckBoxNotifier extends ValueNotifier<bool>  {
  SelectNameCheckBoxNotifier(bool value) : super(value);

  void changeCheckBox(bool item) {
    value = item;
    notifyListeners();
  }

}
class SelectTrainerCheckBoxNotifier extends ValueNotifier<bool>  {
  SelectTrainerCheckBoxNotifier(bool value) : super(value);

  void changeCheckBox(bool item) {
    value = item;
    notifyListeners();
  }

}