import 'package:flutter/material.dart';
import 'package:wallet_apps/screens/auth/login_page.dart';
import 'package:wallet_apps/screens/home/home_page.dart';
import 'package:wallet_apps/widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: wAppLoading()));
  }

  void _checkUserSementara(bool user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => user ? HomePage() : LoginPage()),
    );
  }
}
