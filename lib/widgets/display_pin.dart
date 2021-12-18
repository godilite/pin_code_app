import 'package:flutter/material.dart';

class DisplayPin extends StatelessWidget {
  final String? input;

  /// required PIN length.
  final int pinLength;

  const DisplayPin({
    Key? key,
    required this.pinLength,
    this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: Iterable.generate(
        pinLength,
        (n) => n >= (input?.length ?? 0)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.circle_outlined,
                  color: Colors.grey.shade400,
                  size: 10.0,
                ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.circle,
                  color: Colors.deepPurple,
                  size: 10.0,
                ),
              ),
      ).toList(),
    );
  }
}
