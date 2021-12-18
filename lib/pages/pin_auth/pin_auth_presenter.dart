import 'package:flutter/material.dart';
import 'package:pin_code_app/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinAuthPresenter extends ChangeNotifier {
  static const _lastSavedPin = 'last-pin';

  late String? _savedPin;

  void initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedPin = prefs.getString(_lastSavedPin);
  }

  void onEnterPin(String value) async {
    if (value.length < 4) return;
    if (value == _savedPin) {
      await showAlertDialog('Authentication success', hideButton: true);
    } else {
      await showAlertDialog('Authentication failed', hideButton: true);
    }
  }
}
