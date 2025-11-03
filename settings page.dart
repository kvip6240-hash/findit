import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class them extends StatefulWidget {
  const them({super.key,required String them});
  @override
  State<them> createState() => _themState();
}
class _themState extends State<them> {
  Future<void> saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(value: dark, onChanged: (value)
            {
              setState(() {
                dark = value;
              });
            }),
          ],
        ),
      ),
      theme: dark ? ThemeData.dark() : ThemeData.light(),
    );
  }
}