import 'package:burger_app_ui/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,

              child: Image.network(
                "https://img.freepik.com/premium-photo/closeup-juicy-burger-with-fries-it-look-very-delicious-big-sandwich-hamburger-with-juicy-beef-burger-cheese-tomato-red-onion_620624-6886.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.05),
                const Center(
                  child: const Text(
                    "                      👑",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const Center(
                  child: Text(
                    "BURGER \nQUEEN",
                    style: TextStyle(
                      height: 0.9,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.42 ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Food\nTasty Food *",
                        style: TextStyle(fontSize: 40,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 172, 109, 8),


                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        ),
                      ),

                      SizedBox(height: size.height * 0.05 ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyBottomNavBar()
                              )

                            );
                          },

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: const Center(
                            child: Padding(padding: EdgeInsets.all(14),
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                          ),
                          
                        ),
                      ),

                                            SizedBox(height: size.height * 0.05 ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Don't have an account?",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white70,
                                                  ),
                                                ),

                                                Text(
                                                  "Sign up",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    decoration: TextDecoration.underline,
                                                    decorationColor: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                 
                                              ],
                                            )

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
