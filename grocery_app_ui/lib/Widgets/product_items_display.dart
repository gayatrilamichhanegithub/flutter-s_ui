import 'package:flutter/material.dart';
import 'package:grocery_app_ui/Model/products.dart';

class ProductImetsDisplay extends StatelessWidget {
  final Grocery grocery;
  const ProductImetsDisplay({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsetsGeometry.all(10),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 30,
                          spreadRadius: 15,
                          color: grocery.color!.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                ),

                Center(child: Hero(
                  tag: grocery.image,
                  child: Image.asset(grocery.image, height: 160))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grocery.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          grocery.category,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          "\$${grocery.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        color: Colors.orange[900],
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
