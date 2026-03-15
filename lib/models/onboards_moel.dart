class OnBoards {
  final String text, image;

  OnBoards({required this.text, required this.image});
}

List<OnBoards> onBoardData = [
  OnBoards(
      text: "Join us and discover the best\npet in your location.",
      image: "assets/images/dog.png"),
  OnBoards(
      text: "We help people connect with pet \naround your location.",
      image: "assets/images/cat.png"),
  OnBoards(
      text: "We show the easy way to adopt pet. \nJust stay at home with us.",
      image: "assets/images/rabbit.png"),
];