import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _resendEmailButton() {
    return Column(
      children: [
        Text("Didn't Receive an email?"),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });

            await Future.delayed(Duration(seconds: 2));

            setState(() {
              _isLoading = false;
              _isSended = true;
            });
          },
          child: Text(_isLoading ? "Sending" : "Resend Email"),
        ),
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
      child: Text("Email sended!", style: TextStyle(color: Colors.green)),
    );
  }

  Widget _bottomWidget() {
    return _isSended ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            child: Icon(Icons.drag_handle),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alternate_email, size: 68, color: Colors.blue),
                Text(
                  "Verify Your Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  "We have sent a verification link to your email address.",
                  textAlign: TextAlign.center,
                ),
                Divider(height: 40, indent: 50, endIndent: 50),
                Text(
                  "Please click the link in the email\n to verify your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
                Divider(height: 40, indent: 50, endIndent: 50),
                _bottomWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
