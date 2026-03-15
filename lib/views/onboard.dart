import 'package:flutter/material.dart';
import 'package:pet_app_ui/models/onboards_moel.dart';
import 'package:pet_app_ui/utils/const.dart';
import 'package:pet_app_ui/views/pets_home_screen.dart';

class PetsOnBoardingScreen extends StatefulWidget {
 

  @override
  State<PetsOnBoardingScreen> createState() => _PetsOnBoardingScreenState();
}

class _PetsOnBoardingScreenState extends State<PetsOnBoardingScreen> {
   final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.7,
            color: Colors.white,
            child: PageView.builder(
              itemCount: onBoardData.length,
              onPageChanged: (value)  {
                setState(() {
                  currentPage = value;
                });
              },
              controller: _pageController,
              itemBuilder: (context, index) {
                return onBoardingItems(size, index);
              },
            ),
          ),

          GestureDetector(
            onTap: () {
              if(currentPage == onBoardData.length -1) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder:  (_) =>const PetsHomeScreen(),
                  ),
                  (route) => false);
              
                  
              }else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Container(
              height: 60,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    currentPage == onBoardData.length -1
                   ? "Get Started"
                    : "Continue",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
              List.generate(
                onBoardData.length,
                (index) => indicatorForSlider(index: index),
              ),
            
          ),
        ],
      ),
    );
  }

  Widget indicatorForSlider({int? index}) {
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      width: currentPage == index ? 20 : 10,
      height: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentPage == index ? Colors.orange : black.withOpacity(0.2),
      ),
    );
  }

  Column onBoardingItems(Size size, int index) {
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 230,
                    width: size.width * 0.9,
                    color: orangeContainer,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: -40,
                          height: 130,
                          width: 130,

                          child: Image.network(
                            "https://img.freepik.com/free-vector/frame-with-dogs-vector-white-background_53876-127700.jpg",
                          ),
                        ),

                        Positioned(
                          bottom: -20,
                          right: -20,
                          height: 130,
                          width: 130,

                          child: Image.network(
                            "https://img.freepik.com/free-vector/frame-with-dogs-vector-white-background_53876-127700.jpg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 60,
                child: Image.asset(
                  onBoardData[index].image,
                  height: 375,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 35,
              color: black,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
            children: [
              TextSpan(text: "Find you "),
              TextSpan(
                text: "Dream\n",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w900,
                ),
              ),

              TextSpan(text: "Pet Here "),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          onBoardData[index].text,
          style: TextStyle(fontSize: 15.5, color: Colors.black38),
        ),
      ],
    );
  }
}
