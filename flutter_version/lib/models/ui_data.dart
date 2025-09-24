// Archivo: lib/models/ui_data.dart
import 'package:flutter/foundation.dart';

class UiData with ChangeNotifier {
  String _inputText = "";
  bool _isChecked = false;
  String _radioOption = "Ninguno";
  bool _isSwitchedOn = false;
  String _lastButtonPressed = "Ninguno";
  bool _wasProgressStarted = false;

  // Getters para que las vistas puedan leer los datos
  String get inputText => _inputText;
  bool get isChecked => _isChecked;
  String get radioOption => _radioOption;
  bool get isSwitchedOn => _isSwitchedOn;
  String get lastButtonPressed => _lastButtonPressed;
  bool get wasProgressStarted => _wasProgressStarted;

  // Setters para que las vistas puedan modificar el estado
  void setInputText(String text) {
    _inputText = text;
    notifyListeners(); // Notifica a los widgets que escuchan para que se redibujen
  }

  void setChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void setRadioOption(String option) {
    _radioOption = option;
    notifyListeners();
  }

  void setSwitch(bool value) {
    _isSwitchedOn = value;
    notifyListeners();
  }

  void setLastButton(String buttonName) {
    _lastButtonPressed = buttonName;
    notifyListeners();
  }

  void setProgressStarted(bool value) {
    _wasProgressStarted = value;
    notifyListeners();
  }

  void resetAllData() {
    _inputText = "";
    _isChecked = false;
    _radioOption = "Ninguno";
    _isSwitchedOn = false;
    _lastButtonPressed = "Ninguno";
    _wasProgressStarted = false;
    notifyListeners();
  }
}