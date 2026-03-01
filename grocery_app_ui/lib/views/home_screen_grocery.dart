import 'package:flutter/material.dart';
import 'package:grocery_app_ui/Model/products.dart';
import 'package:grocery_app_ui/Utils/constants.dart';
import 'package:grocery_app_ui/Widgets/product_items_display.dart';
import 'package:grocery_app_ui/views/product_detail_screen.dart';

class HomeScreenGrocery extends StatefulWidget {
  const HomeScreenGrocery({super.key});

  @override
  State<HomeScreenGrocery> createState() => _HomeScreenGroceryState();
}

class _HomeScreenGroceryState extends State<HomeScreenGrocery> {
  String categoryes = 'ALL';
  List<Grocery> grocery = groceryItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              headerParts(),
              // for search bar and filter
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                grocery = groceryItems
                                    .where(
                                      (element) => element.name
                                          .toLowerCase()
                                          .contains(value.toLowerCase()),
                                    )
                                    .toList();
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 30,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search Grocery",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green[50],
                      ),
                      child: Icon(
                        Icons.tune_rounded,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              // for category
              const SizedBox(height: 10),

              categoryItems(),

              //display the category items
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(
                      grocery.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                             MaterialPageRoute(builder: (_) => ProductDetailScreen(
                              product: grocery[index],
                              )));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: ProductImetsDisplay(grocery: grocery[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsetsGeometry.only(top: 15, left: 10, bottom: 20),
                child: Text(
                  "Recent Shop",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    groceryItems.where((items) => items.isRecent).length,
                    (index) {
                      Grocery recent = groceryItems
                          .where((items) => items.isRecent)
                          .toList()[index];
                      return Padding(
                        padding: index == 0
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.only(right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(recent.image),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      recent.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      recent.category,
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 2,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                "\$${recent.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -2,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding categoryItems() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          groceryCategories.length,

          (index) => GestureDetector(
            onTap: () {
              setState(() {
                categoryes = groceryCategories[index];
                categoryes == "ALL"
                    ? grocery = groceryItems
                    : grocery = groceryItems
                          .where(
                            (element) =>
                                element.category.toLowerCase() ==
                                categoryes.toLowerCase(),
                          )
                          .toList();
              });
              // now we make it function
            },
            child: SizedBox(
              height: 40,
              child: Column(
                children: [
                  Text(
                    groceryCategories[index],
                    style: TextStyle(
                      fontSize: categoryes == groceryCategories[index]
                          ? 18
                          : 16,
                      color: categoryes == groceryCategories[index]
                          ? textGreen
                          : Colors.black26,
                      fontWeight: categoryes == groceryCategories[index]
                          ? FontWeight.w900
                          : FontWeight.w500,
                    ),
                  ),
                  categoryes == groceryCategories[index]
                      ? const CircleAvatar(
                          radius: 4,
                          backgroundColor: textGreen,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Welcome\n",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                TextSpan(
                  text: "Nafia Ibrahim",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm2GV80cCR_upaMOeVmMbd9moIQnYJHWl1Yw&s",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
