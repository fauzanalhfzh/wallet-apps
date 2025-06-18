import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet_apps/widgets/widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _email = TextEditingController();
  bool _isLoading = false;

  Widget _inputEmail() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: "Email",
        helperText: "Enter your email",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    wAuthTitle(
                      title: "Forgot Password",
                      subtitle:
                          "Enter your email and we will send you a link to reset your password.",
                    ),
                    _inputEmail(),
                    SizedBox(height: 20),
                    wInputSubmit(
                      onPressed: () {
                        forgotPasswordtesting();
                      },
                      title: "Send Reset Link",
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void forgotPasswordtesting() async {
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1));
      wShowToast("Email sent successfully!");
      Navigator.pop(context);
    } else {
      log("Login gagal silahkan coba lagi");
    }
  }
}
