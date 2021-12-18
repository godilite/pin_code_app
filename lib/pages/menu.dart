import 'package:flutter/material.dart';
import 'package:pin_code_app/pages/create_pin/create_pin.dart';
import 'package:pin_code_app/pages/pin_auth/pin_auth.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreatePin())),
              child: const Text('Create Pin'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PinAuth())),
              child: const Text('Authenticate By Pin'),
            )
          ],
        ),
      ),
    );
  }
}
