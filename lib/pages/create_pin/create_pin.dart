import 'package:flutter/material.dart';
import 'package:pin_code_app/pages/create_pin/create_pin_presenter.dart';
import 'package:pin_code_app/widgets/keypad_widget.dart';
import 'package:provider/provider.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreatePinPresenter(),
      child: const _CreatePin(),
    );
  }
}

class _CreatePin extends StatefulWidget {
  const _CreatePin({Key? key}) : super(key: key);

  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<_CreatePin> {
  CreatePinPresenter get presenter => Provider.of<CreatePinPresenter>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          'Setup PIN',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            presenter.showRepeatPin ? 'Re-enter your PIN' : 'Create PIN',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 400,
            child: KeypadWidget(
              onTextInput: presenter.onInput,
            ),
          )
        ],
      ),
    );
  }
}
