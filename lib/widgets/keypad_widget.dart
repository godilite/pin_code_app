import 'package:flutter/material.dart';
import 'package:pin_code_app/widgets/display_pin.dart';
import 'package:pin_code_app/widgets/keypad_presenter.dart';

GlobalKey<CustomKeyboardState> customKeyboardKey = GlobalKey();

class KeypadWidget extends StatefulWidget {
  final ValueSetter<String> onTextInput;

  const KeypadWidget({
    Key? key,
    required this.onTextInput,
  }) : super(key: key);

  @override
  State<KeypadWidget> createState() => _KeypadWidgetState();
}

class _KeypadWidgetState extends State<KeypadWidget> {
  String _input = '';
  static const _pinLength = 4;

  void _updateInput(String text) {
    setState(() {
      _input = text;
    });
    widget.onTextInput.call(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DisplayPin(
          pinLength: _pinLength,
          input: _input,
        ),
        const Spacer(),
        CustomKeyboard(
          key: customKeyboardKey,
          onTextInput: _updateInput,
          inputLength: _pinLength,
        ),
      ],
    );
  }
}

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    Key? key,
    this.onTextInput,
    required this.inputLength,
  }) : super(key: key);

  final ValueSetter<String>? onTextInput;
  final int inputLength;

  @override
  State<CustomKeyboard> createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  final presenter = KeypadPresenter();
  void _textInputHandler(String text) {
    presenter.insertText(text);
    widget.onTextInput?.call(presenter.input);
  }

  void _backspaceHandler() {
    presenter.backspace();
    widget.onTextInput?.call(presenter.input);
  }

  void clearInput() {
    presenter.clear();
    widget.onTextInput?.call(presenter.input);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          _buildRow(presenter.numbers.sublist(0, 3)),
          const SizedBox(height: 10),
          _buildRow(presenter.numbers.sublist(3, 6)),
          const SizedBox(height: 10),
          _buildRow(presenter.numbers.sublist(6, 9)),
          const SizedBox(height: 10),
          _buildLastRow()
        ],
      ),
    );
  }

  Widget _buildRow(List<int> inputs) {
    return Expanded(
      child: Row(
        children: inputs
            .map((value) => TextKey(
                  text: value.toString(),
                  onTextInput: _textInputHandler,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildLastRow() {
    return Expanded(
      child: Row(
        children: [
          const Spacer(),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    required this.text,
    this.onTextInput,
  }) : super(key: key);

  final String text;
  final ValueSetter<String>? onTextInput;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          shape: const CircleBorder(),
          color: Colors.grey.shade100,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              onTextInput?.call(text);
            },
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    this.onBackspace,
  }) : super(key: key);

  final VoidCallback? onBackspace;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              onBackspace?.call();
            },
            child: const Center(
              child: Icon(
                Icons.backspace,
                size: 35,
                color: Color(0xff97ADB6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
