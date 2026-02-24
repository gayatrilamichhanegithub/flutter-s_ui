import 'dart:ui';

class Coffee{
  String name, image;
  Color color;
  double price;
  double star;
  Coffee({
    required this.color,
    required this.image,
    required this.name,
    required this.price,
    required this.star,
  });
}

List<Coffee> coffeelist = [
  Coffee(
    name: "Espresso",
    image: "assets/images/espresso.png",
    color: const Color(0xff65C5B2),
    price: 5,
    star: 4.4
  ),

  Coffee(
    name: "Cafe Mocha",
    image: "assets/images/Caffe_Mocha.png",
    color: const Color(0xff8D5FDC),
    price: 11,
    star: 4.9
  ),

Coffee(
    name: "Caramel Macchiato",
    image: "assets/images/Caramel_Macchiato.png",
    color: const Color(0xffFF9839),
    price: 5,
    star: 4.4
  ),

  Coffee(
    name: "Affogato",
    image: "assets/images/affogato.png",
    color: const Color.fromARGB(255, 183, 155, 14),
    price: 12,
    star: 4.0
  ),

  Coffee(
    name: "Cortado",
    image: "assets/images/cortado.png",
    color: const Color(0xff8D5FDC),
    price: 8,
    star: 5.0
  ),

  Coffee(
    name: "Cafe Cubano",
    image: "assets/images/cafe_cubano.png",
    color: const Color(0xff65C5B2),
    price: 15,
    star: 4.5
  ),
];