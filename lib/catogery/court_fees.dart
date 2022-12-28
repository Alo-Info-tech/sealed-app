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

List<JudicialContent> tab1 = [
  JudicialContent(
    text: 'Court Fees Stamp 5',
    title: 'Rs.5 Court Fees Stamp',
    image: 'assets/images/stamb.png',
    discription: "₹5",
  ),
  JudicialContent(
    text: 'Court Fees Stamp 10',
    title: 'Rs.10 Court Fees Stamp',
    image: 'assets/images/stamb.png',
    discription: "₹10",
  ),
  JudicialContent(
    text: 'Court Fees Stamp 20',
    title: 'Rs.20 Court Fees Stamp',
    image: 'assets/images/stamb.png',
    discription: "₹20",
  ),
];
