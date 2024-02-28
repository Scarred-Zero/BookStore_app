import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bookstore_app/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.bounceIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.4, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.bounceIn),
      ),
    );

    // WAIT FOR 3 SECONDS TO NAVIGATE TO THE HOME SCREEN
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);
    });

    // START THE ANIMATION AFTER THE WIDGET IS FULLY BUILT
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 100, 150),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "Book",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "Store",
                            style: TextStyle(
                                color: Color.fromARGB(255, 58, 149, 254)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
