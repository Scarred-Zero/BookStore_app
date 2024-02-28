// ignore_for_file: camel_case_types

import 'package:bookstore_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/onboard-screen';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _onBoardingScreen();
}

class _onBoardingScreen extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 74, 100, 150), // Set the background color to #131E32
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/embody_img.jpg',
              height: 400,
            ),
            const SizedBox(height: 16),
            const Text(
              'Get access to all books\non the go',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'All your favorite books in one place',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the new page here
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 58, 149, 254),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
