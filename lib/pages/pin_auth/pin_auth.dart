import 'package:flutter/material.dart';
import 'package:pin_code_app/pages/pin_auth/pin_auth_presenter.dart';
import 'package:pin_code_app/widgets/keypad_widget.dart';
import 'package:provider/provider.dart';

class PinAuth extends StatelessWidget {
  const PinAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PinAuthPresenter()..initialize(),
      child: const _PinAuth(),
    );
  }
}

class _PinAuth extends StatefulWidget {
  const _PinAuth({Key? key}) : super(key: key);

  @override
  _PinAuthState createState() => _PinAuthState();
}

class _PinAuthState extends State<_PinAuth> {
  PinAuthPresenter get presenter => Provider.of<PinAuthPresenter>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your PIN',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 400,
            child: KeypadWidget(
              onTextInput: presenter.onEnterPin,
            ),
          )
        ],
      ),
    );
  }
}
