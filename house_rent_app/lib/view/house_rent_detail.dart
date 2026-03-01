import 'package:flutter/material.dart';
import 'package:house_rent_app/model/house_model.dart';
import 'package:house_rent_app/utils/colors.dart';

class HouseRentDetail extends StatelessWidget {
  final HouseRoom houseRoom;
  const HouseRentDetail({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(30),
                    child: Hero(
                      tag: houseRoom.image,
                      child: Image.asset(
                        houseRoom.image,
                        fit: BoxFit.cover,
                        height: size.height * 0.40,
                        cacheWidth: 800,
                      ),
                    ),
                  ),
                  // for back button
                  Positioned(
                    top: 20,
                    right: 20,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ),
          
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const InkWell(
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          
                  Positioned(
                    bottom: -30,
                    left: 20,
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "\$ ${houseRoom.price}.00/M",
                          style: const TextStyle(
                            color: kBlueTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  Positioned(
                    bottom: -120,
                    right: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.8),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: kBackgroundColor,
                        size: 30,
                      ),
                    ),
                  ),
          
                  //
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        houseRoom.name,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          height: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      houseRoom.place,
                      style: TextStyle(
                        height: 1.2,
                        color: kFontColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Room Facilities",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 2,
                        ),
                      ),
          
                      Text(
                        "To much work. Let's burn it and say we dumped it in sewar. oh this write.",
                        style: TextStyle(
                          fontSize: 15,
                          color: kFontColor.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "Read More",
                        style: TextStyle(
                          fontSize: 18,
                          height: 2,
                          fontWeight: FontWeight.w500,
                          color: kBlueColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          roomInfo("image/house-rent/icon1.png", houseRoom.height),
                          roomInfo("image/house-rent/icon2.png", houseRoom.width),
                          roomInfo("image/house-rent/icon3.png",
                          "${houseRoom.bath} Baths",),
                          roomInfo("image/house-rent/icon4.png", houseRoom.type),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Center(
                        child: Container(
                          width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xff002140),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Padding(padding: EdgeInsets.all(20),
                          child: Text(
                            "Book The Appartment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          ),
                        ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container roomInfo(String ImagePath, String value) {
    return Container(
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePath, height: 40),
          const SizedBox(height: 7),
          Text(
            value,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
