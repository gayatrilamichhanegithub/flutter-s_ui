import 'package:flutter/material.dart';
import 'package:pet_app_ui/models/cats_model.dart';
import 'package:pet_app_ui/utils/const.dart';
import 'package:readmore/readmore.dart';

class PetsDetailPage extends StatefulWidget {
  final Cat cat;
  const PetsDetailPage({super.key, required this.cat});

  @override
  State<PetsDetailPage> createState() => _PetsDetailPageState();
}

class _PetsDetailPageState extends State<PetsDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            /// Top image container
            itemsImageAndBackground(size),

            /// Back button & more icon
            backButton(size),

            /// Bottom detail section
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.52,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        /// Name & location
                        nameAdressAndFavoriteButton(),

                        SizedBox(height: 20),

                        /// Info cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            moreInfo(
                              blue,
                              blueBackground,
                              "Age",
                              "${widget.cat.age}",
                            ),

                            moreInfo(
                              orangeContainer,
                              Colors.orange.shade100,
                              "Weight",
                              "${widget.cat.weight} Kg",
                            ),

                            moreInfo(
                              buttonColor,
                              Colors.blue.shade100,
                              "Sex",
                              widget.cat.sex,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        //owner
                        ownerinfo(),
                        // for description
                        SizedBox(height: 20),
                        ReadMoreText(
                          widget.cat.description,
                          textAlign: TextAlign.justify,
                          trimCollapsedText: 'See More',
                          colorClickableText: Colors.orange,
                          trimLength: 100,
                          trimMode: TrimMode.Length,
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        // for adopt me button
                        Container(
                          height: 60,width: 300,
                          decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(25),
                         color: buttonColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Adopt Me',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row ownerinfo() {
    return Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: widget.cat.color,
                            backgroundImage: AssetImage(
                              widget.cat.owner.image,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cat.owner.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.cat.name} Owner",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: color3.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.chat_outlined,
                              color: Colors.lightBlue,
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 10),

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.phone_outlined,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                        ],
                      );
  }

  Row nameAdressAndFavoriteButton() {
    return Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cat.name,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: blue,
                                    ),
                                    Text(
                                      '${widget.cat.location} (${widget.cat.distance})',
                                      style: TextStyle(
                                        color: black.withOpacity(0.6),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// Favorite icon
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 3),
                                  color: widget.cat.fav
                                      ? Colors.red.withOpacity(0.1)
                                      : black.withOpacity(0.2),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Icon(
                              widget.cat.fav
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: widget.cat.fav
                                  ? Colors.red
                                  : black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      );
  }

  Positioned backButton(Size size) {
    return Positioned(
            height: size.height * 0.14,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back, color: black),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.more_horiz_outlined, color: black),
                ),
              ],
            ),
          );
  }

  Container itemsImageAndBackground(Size size) {
    return Container(
            height: size.height * 0.50,
            width: size.width,
            decoration: BoxDecoration(
              color: widget.cat.color.withOpacity(0.5),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    widget.cat.image,
                    height: size.height * 0.45,
                  ),
                ),
              ],
            ),
          );
  }

  /// Info Card Widget
  Widget moreInfo(pawColor, backgroundColor, title, value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: 0,
            child: Image.network(
              'https://i0.wp.com/picjumbo.com/wp-content/uploads/green-natural-background-with-wooden-surface-free-image.jpeg?w=2210&quality=70',
              color: pawColor,
              height: 55,
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
