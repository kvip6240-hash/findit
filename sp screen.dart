
import 'dart:async';
//
import 'package:flutter/material.dart';

import 'introduction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnim = Tween<double>(begin: 0.7, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        _controller.forward();
      });
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Introduction()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [ Colors.grey,
              ?Colors.grey[800],
              Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnim,
                child: Container(
                  width: size.width * 0.42,
                  height: size.width * 0.42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 12,
                        offset:  Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Find It",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 28),
              Text(
                "Simple. Fast.Go.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 160,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

