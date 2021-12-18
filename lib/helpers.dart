import 'package:flutter/cupertino.dart';
import 'package:pin_code_app/main.dart';

Future<void> showAlertDialog(String message, {hideButton = false}) {
  return showCupertinoDialog(
    context: navigatorKey.currentState!.context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(message),
        actions: <Widget>[
          if (!hideButton)
            CupertinoDialogAction(
              onPressed: () => navigatorKey.currentState!.pop(),
              child: const Text('Ok'),
            ),
        ],
      );
    },
  );
}
