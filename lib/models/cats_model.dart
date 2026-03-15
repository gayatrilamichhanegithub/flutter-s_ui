import 'package:flutter/material.dart';

List<String> categories = ['Cats', 'Dogs', 'Birds', 'Fishs'];


class Cat {
  final Color color;
  final String name, location, sex, image, description;
  final double age, weight;
  final int distance;
  final bool fav;
  final Owner owner;

  Cat({
    required this.fav,
    required this.image,
    required this.color,
    required this.description,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
    required this.owner,
  });
}



List<Cat> cats = [
  Cat(
    name: "Kitty",
    image: "assets/images/cat.png",
    color: const Color(0xfff8d8d8),
     location: "Chicago, US",
    sex: "Female",
    description: description,
    age: 2,
    weight: 3.5,
    distance: 2,
    fav: true,
    owner: Owner(
      name: "John Doe",
      image: "assets/images/owner.png",
      bio: "Animal lover and pet caretaker.",
    ),
  ),
  Cat(
    name: "Tom",
    image: "assets/images/cat2.png",
    color: const Color(0xffd8f8e8),
     location: "Chicago, US",
    sex: "Male",
     description: description,
    age: 1.5,
    weight: 4,
    distance: 4,
    fav: true,
    owner: Owner(
      name: "Sarah",
      image: "assets/images/owner1.png",
      bio: "Pet rescue volunteer.",
    ),
  ),


Cat(
  name: "Luna",
  image: "assets/images/cat3.png",
  color: const Color.fromARGB(255, 62, 56, 219),
   location: "New York, US",
  sex: "Female",
   description: description,
  age: 2,
  weight: 3.5,
  distance: 6,
  fav: false,
  owner: Owner(
    name: "Michael",
    image: "assets/images/owner2.png",
    bio: "Animal lover and pet trainer.",
  ),
),

Cat(
  name: "Milo",
  image: "assets/images/cat4.png",
  color: const Color(0xfffce4b0),
   location: "Los Angeles, US",
  sex: "Male",
   description: description,
  age: 1,
  weight: 2.8,
  distance: 3,
  fav: true,
  owner: Owner(
    name: "Emma",
    image: "assets/images/owner3.png",
    bio: "Veterinary student and cat lover.",
  ),
),
];
class Owner {
  final String name;
  final String image;
  final String bio;

  Owner({
    required this.name,
    required this.image,
    required this.bio,
  });
}
String description =
    "This cat is friendly, playful, and looking for a loving home. "
    "It enjoys playing, sleeping, and spending time with people."; 

 