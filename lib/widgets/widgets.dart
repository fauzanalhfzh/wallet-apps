import 'package:flutter/material.dart';

/// Widget loading screen
Widget wAppLoading() {
  return Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator()),
  );
}

/// Auth title
Widget wAuthTitle({required String title, required String subtitle}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(subtitle),
      ],
    ),
  );
}

/// Text divider
Widget wtextDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Text(
            "OR CONNECT WITH",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

/// Button google sign in
Widget wGoogleSignIn({required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
      label: Text("Google"),
      icon: Icon(Icons.adb),
      onPressed: onPressed,
    ),
  );
}

/// Button input submit
Widget wInputSubmit({required VoidCallback onPressed, required String title}) {
  return SizedBox(
    width: double.infinity,
    child: FilledButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: Text(title),
    ),
  );
}
