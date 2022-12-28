class JudicialContent {
  String image;

  String title;
  String text;
  String discription;

  JudicialContent({
    required this.image,
    required this.title,
    required this.text,
    required this.discription,
  });
}

List<JudicialContent> tab4 = [
  JudicialContent(
    text: 'Postal Stamp ',
    title: 'Rs.1 Postal Stamp',
    image: 'assets/images/stamb.png',
    discription: "₹1",
  ),
];
