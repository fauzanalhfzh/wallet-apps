import 'package:flutter/material.dart';
import 'package:wallet_apps/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashPage(), debugShowCheckedModeBanner: false);
  }
}
