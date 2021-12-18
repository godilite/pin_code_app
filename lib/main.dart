import 'package:flutter/material.dart';
import 'package:pin_code_app/pages/menu.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Code App',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      navigatorKey: navigatorKey,
      home: const Menu(),
    );
  }
}
