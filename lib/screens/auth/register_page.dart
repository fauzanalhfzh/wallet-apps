import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet_apps/screens/auth/login_page.dart';
import 'package:wallet_apps/screens/auth/verify_email_page.dart';
import 'package:wallet_apps/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();
  bool _isLoading = false;

  Widget _inputEmail() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: "Email",
        helperText: "Masukkan email Anda",
      ),
    );
  }

  Widget _inputName() {
    return TextField(
      controller: _name,
      decoration: InputDecoration(
        hintText: "Nama Lengkap",
        helperText: "Masukkan nama lengkap Anda",
      ),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "****",
              helperText: "Password",
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _passwordConf,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "****",
              helperText: "Confirm Password",
            ),
          ),
        ),
      ],
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
                      title: "Register",
                      subtitle: "Create a new account",
                    ),
                    _inputName(),
                    _inputEmail(),
                    _inputPassword(),
                    SizedBox(height: 20),
                    wInputSubmit(
                      onPressed: () {
                        registerSementara();
                      },
                      title: "Register",
                    ),
                    wtextDivider(),
                    wGoogleSignIn(
                      onPressed: () {
                        log("Login with google");
                      },
                    ),
                    wTextLink(
                      description: "Already have an account?",
                      title: "Login",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void registerSementara() async {
    log("Name = ${_name.text}");
    log("Email = ${_email.text}");
    log("Password = ${_password.text}");
    log("Confirm Password = ${_passwordConf.text}");
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return VerifyEmailPage();
      },
    );
  }
}
