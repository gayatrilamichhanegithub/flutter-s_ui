import 'package:burger_app_ui/view/burger_home_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedInex = 0;
  late final List<Widget> page;
  void initState() {
    page =[
      const BurgerHomePage(),
      navBarPage(Icons.shopping_cart_outlined),
      navBarPage(Icons.favorite_border),
      navBarPage(Icons.note_add_outlined),


    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 33,
        currentIndex: selectedInex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedInex = index;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined), label: ""),
        ],
      ),
      body: page[selectedInex],


    );
  }

  navBarPage(iconName) {
    return Center(child: Icon(iconName, size: 100, color: Colors.black));
  }
}
