import 'package:flutter/material.dart';
import 'package:pin_code_app/helpers.dart';
import 'package:pin_code_app/widgets/keypad_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePinPresenter extends ChangeNotifier {
  bool _showRepeatPin = false;
  bool get showRepeatPin => _showRepeatPin;
  static const _lastSavedPin = 'last-pin';

  String pin = '';

  Future<void> onInput(String value) async {
    if (value.length == 4) {
      if (_showRepeatPin) {
        pin == value
            ? savePin()
            : await showAlertDialog(
                'PIN must match the previously entered PIN');
      }
      pin = value;
      _showRepeatPin = !_showRepeatPin;
      customKeyboardKey.currentState?.clearInput();
      notifyListeners();
    }
  }

  void savePin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _lastSavedPin,
      pin,
    );

    await showAlertDialog('Your PIN has been setup successfully');
  }
}
