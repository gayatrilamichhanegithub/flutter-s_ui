import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_app_ui/Utils/constants.dart';
import 'package:grocery_app_ui/Widgets/bottom_nav_bar.dart';

class GroceryOnBoard extends StatelessWidget {
  const GroceryOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: ClipPath(
                clipper: ClipPathOnBoard(),
                child: Container(
                  color: onboardbackground,
                  width: size.width,
                  height: size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Image.asset(
                      "assets/grocery/onboarding_profile.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
              child:   Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "Buy Groceries\nEasilly With us",
                      style: TextStyle(
                        fontSize: 35,
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Listen podcast and open your\nworld this application",
                      style: TextStyle(
                        fontSize: 18,
                         
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BottomNavBar(),
                            ),
                          (route) => false);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50,
                        
                          ),
                          gradient: gradientColor,
                        ),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 70,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
