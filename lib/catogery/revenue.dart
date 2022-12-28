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

List<JudicialContent> tab3 = [
  JudicialContent(
    text: 'Revenue Stamp ',
    title: 'Rs.1 Revenue Stamp',
    image: 'assets/images/stamb.png',
    discription: "₹1",
  ),
];
