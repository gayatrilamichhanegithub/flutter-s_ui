import 'package:coffee_shope_app/Utils/colors.dart';
import 'package:coffee_shope_app/view/coffee_shop_home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: backgroundColor,
body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 35),
child: Center(
  child: Column(
     children: [
       SizedBox(
        height: 50,
        width: 90,
        child: Image.asset("assets/images/logo.png"),
      ),
      const SizedBox(height: 5),
      Text(
        "KOKUMI",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
       Text(
        "The Best",
        style: TextStyle(
          height: 0.7,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
            const SizedBox(height: 5),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    GestureDetector(
      onTap: () {
Navigator.push(
  context,
MaterialPageRoute(builder: (_) => const CoffeeShopHomeScreen(),
),
);
      },
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
 

      ),
    ),

    Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
       border: Border.all(color: buttonColor),
      ),
      child: const Center(
        child: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     
    
    )
  ],
),

SizedBox(height: 20),
socialIconButton(Colors.white,
  "assets/images/google.png",
  "Connect with Google", Colors.black,
),
const SizedBox(height: 25),
socialIconButton(facebookButtonColor,
 "assets/images/facebook.png",
  "Connect with Google", Colors.white,

),
const SizedBox(height: 25),
Expanded(child: Image.asset("assets/images/555.png",
height: 70,
))
    ],
  ),
),

)),
    );
  }

  Container socialIconButton(color,image, title, textColor) {
    return Container(
height: 50,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: color,
),

child: Row(children: [Image.asset(image,
height: 25,
),
const SizedBox(width: 10),
Text(
  title,
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textColor,
  ),
)  
],),
);
  }
}