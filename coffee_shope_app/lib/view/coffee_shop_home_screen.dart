import 'package:coffee_shope_app/Model/coffee_model.dart';
import 'package:coffee_shope_app/Utils/colors.dart';
import 'package:coffee_shope_app/view/coffee_detail_screen.dart';
import 'package:flutter/material.dart';

class CoffeeShopHomeScreen extends StatefulWidget {
  const CoffeeShopHomeScreen({super.key});

  @override
  State<CoffeeShopHomeScreen> createState() => _CoffeeShopHomeScreenState();
}

class _CoffeeShopHomeScreenState extends State<CoffeeShopHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(

        children: [
          SizedBox(
            child: Center(
              child:  Image.asset(
                "assets/images/33.png",
                height: 70,
               // width: 120,
               // fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),
          const Text(
            "House Signeture",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          searchBox(),
          Expanded(child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: GridView.builder(
              itemCount: coffeelist.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final coffee = coffeelist[index];
              return GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (_) =>
                    CoffeeDetailScreen(coffee: coffee)
                  ),
                  );
                 },
                 child: Container(
                  decoration: BoxDecoration(
                    color: coffee.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15,
                  vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(coffee.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                          )),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors:  
                              [
                                coffee.color.withOpacity(0.2),
                                Colors.black54
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomCenter
                              ),
                            ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 32,
                              ),
                            
                          )
                        ],
                      ),

                      Expanded(child: Hero(
                        tag: coffee.image,
                        child: Image.asset(coffee.image,
                        fit: BoxFit.cover,
                        ),
                      ))
                    ],
                  ),
                 ),
                
              );
          
            },
            ),
          ))
        ],
        
      ),
      )),
    );
  }

  SizedBox searchBox() {
    return SizedBox(
          height: 52,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.black26,fontSize: 22),
                prefixIcon: const Icon(
                  Icons.search,size: 35,
                ),
                filled: true,
                fillColor: fillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )
              ),
            ),
          ),
        );
  }
}