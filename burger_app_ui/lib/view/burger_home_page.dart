import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BurgerHomePage extends StatefulWidget {
  const BurgerHomePage({super.key});

  @override
  State<BurgerHomePage> createState() => _BurgerHomePageState();
}

class _BurgerHomePageState extends State<BurgerHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 3),
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/image/menu.png",
                            width: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 5,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW4aDrtn8FFk9DjrybiqR2U-8sHXJ_xtmjhA&s",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Find and order", style: TextStyle(fontSize: 40)),
                      Text(
                        "burger for you 🍔",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.04),
              searchBar(),
              SizedBox(height: 40),
              SizedBox(
                child: ListView.builder(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                            child: Text(
                              CategoryList[index],style: TextStyle(),
                            ),
                          ),


                        )
                      ],
                    ),
                    ),
                  );
                }),
              )

            ],
          ),
        ),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
              padding: EdgeInsets.only(right: 20),
            child: TextField(decoration: InputDecoration(
              hintText: "Find your burger",
              hintStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black38,
              ),
              prefixIcon: Icon(Icons.search, size: 30),
              filled: true,
              fillColor: Colors.grey.shade100,
               contentPadding: EdgeInsets.all(20),
               enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(15),
               ),
               focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(15),
               ),


              )

            ),);
  }
}
