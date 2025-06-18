import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet_apps/screens/home/home_page.dart';
import 'package:wallet_apps/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obsecureText = true;
  bool _isLoading = false;

  Widget _inputEmail() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: [
        TextField(
          controller: _password,
          obscureText: _obsecureText,
          decoration: InputDecoration(hintText: "Password"),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: _obsecureText
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            color: Colors.grey[600],
            onPressed: () {
              setState(() => _obsecureText = !_obsecureText);
            },
          ),
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Text("Forgot Password ?"),
        ),
      ),
      onTap: () {
        log("hello");
      },
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
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wAuthTitle(
                      title: "Login",
                      subtitle: "Enter your email and password",
                    ),
                    _inputEmail(),
                    _inputPassword(),
                    _forgotPassword(),
                    wInputSubmit(
                      onPressed: () {
                        log("Email = ${_email.text}");
                        log("Password = ${_password.text}");
                        loginSementara();
                      },
                      title: "Login",
                    ),
                    wtextDivider(),
                    wGoogleSignIn(
                      onPressed: () {
                        log("Login with google");
                      },
                    ),
                    wTextLink(
                      description: "Don't have an account yet?",
                      title: "Register",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void loginSementara() async {
    if (_email.text == 'demo@example.com' && _password.text == "demo123") {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      log("Login gagal silahkan coba lagi");
    }
  }
}
