import 'package:flutter/material.dart';
import 'package:pet_app_ui/models/cats_model.dart';
import 'package:pet_app_ui/utils/const.dart';
import 'package:pet_app_ui/views/pets_detail_page.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selectedCategory = 0;
  int selectedIndex = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat,
    Icons.person_outline_rounded
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: headerParts()),
      bottomNavigationBar: Container(
        height: 45,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 60,
              width: 50,
              padding: EdgeInsets.all(5),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                 Column(
                  children: [
                    Icon(
                      icons[index],
                      size: 30,
                      color: selectedIndex == index
                      ? blue
                      : black.withOpacity(0.6),

                    ),
                  //  SizedBox(height: 5),
                    selectedIndex == index ? Container(height: 5,width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blue,
                    ),)
                    : Container(),
                  ],
                 ),
                 index == 2
                 ? Positioned(
                  right: 0,
                  top: -10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Text(
                      "4",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 )
                 : Container()
                   
                ],
              ),
              
            ),
          )
          ),),
      ),
    );
  }

  Padding headerParts() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Location",
                style: TextStyle(fontSize: 18, color: black.withOpacity(0.6)),
              ),
              SizedBox(width: 5),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: blue,
                size: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Chicago, ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                    children: [
                      TextSpan(
                        text: "US",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.search),
                ),
                SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      const Icon(Icons.notifications_outlined),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          joinNow(),
          SizedBox(height: 10),
          categoryViewAll("Categories"),
          const SizedBox(height: 10),
          categoryItems(),
          const SizedBox(height: 10),
          categoryViewAll("Adopt Pet"),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(cats.length, (index) {
                final cat = cats[index];
                return petsItems(size, cat);
              }),
            ),
          ),
        ],
      ),
    );
    
   }

    

  Padding petsItems(Size size, Cat cat) {
    return Padding(
                padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_) => PetsDetailPage(cat: cat),
                      ),
                       );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: size.height * 0.25,
                      width: size.width * 0.55,
                      color: cat.color.withOpacity(0.5),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -10,
                            right: -10,
                            height: 100,
                            width: 100,
                            child: Transform.rotate(
                              angle: 12,
                              child: Image.network(
                                "https://img.freepik.com/free-photo/vertical-shot-road-going-through-beautiful-colorful-trees-captured-day-time_181624-8309.jpg?semt=ais_rp_50_assets&w=740&q=80",
                              ),
                            ),
                          ),

                          // Positioned(
                          //   top: -10,
                          //   left: -10,
                          //   height: 100,
                          //   width: 100,
                          //   child: Image.network(
                          //     "https://img.freepik.com/free-photo/vertical-shot-road-going-through-beautiful-colorful-trees-captured-day-time_181624-8309.jpg?semt=ais_rp_50_assets&w=740&q=80",
                          //   ),
                          // ),
                          Positioned(
                            bottom: -10,
                            right: 10,
                            child: Hero(
                              tag: cat.image,
                              child: Image.asset(
                                cat.image,
                                height: size.height * 0.23,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cat.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: blue,
                                            size: 20,
                                          ),
                                          Text(
                                            "${cat.distance} km",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    cat.fav
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_outline_rounded,
                                    color: cat.fav
                                        ? Colors.red
                                        : black.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12.withOpacity(0.03),
            ),
            child: Icon(Icons.tune_rounded),
          ),
          ...List.generate(
            categories.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                  selectedCategory = index;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selectedCategory == index
                        ? buttonColor
                        : Colors.black12.withOpacity(0.03),
                  ),

                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedCategory == index ? Colors.white : black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding categoryViewAll(name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                "View All",
                style: TextStyle(fontSize: 16, color: Colors.amber),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber,
                ),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding joinNow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 180,
        width: double.infinity,
        color: blueBackground,
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -30,
              width: 100,
              height: 100,
              child: Transform.rotate(
                angle: 12,
                child: Image.network(
                  "https://i0.wp.com/picjumbo.com/wp-content/uploads/green-natural-background-with-wooden-surface-free-image.jpeg?w=2210&quality=70",
                ),
              ),
            ),
            Positioned(
              bottom: -35,
              left: -15,
              width: 100,
              height: 100,
              child: Transform.rotate(
                angle: -12,
                child: Image.network(
                  "https://i0.wp.com/picjumbo.com/wp-content/uploads/green-natural-background-with-wooden-surface-free-image.jpeg?w=2210&quality=70",
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              height: 150,

              child: Image.asset("assets/images/cat.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join Our Animal \nLovers Community",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.1,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                    ),
                    child: const Text(
                      "Join Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
