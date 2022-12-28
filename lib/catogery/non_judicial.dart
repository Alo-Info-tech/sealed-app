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

List<JudicialContent> tab = [
  JudicialContent(
    text: 'Stamp Paper 20',
    title: 'Rs.20 Stamp Paper',
    image: 'assets/images/stamb.png',
    discription: "₹20",
  ),
  JudicialContent(
    text: 'Stamp Paper 50',
    title: 'Rs.50 Stamp Paper',
    image: 'assets/images/stamb.png',
    discription: "₹50",
  ),
  JudicialContent(
    text: 'Stamp Paper 100',
    title: 'Rs.100 Stamp Paper',
    image: 'assets/images/stamb.png',
    discription: "₹100",
  ),
  JudicialContent(
    text: 'Stamp Paper 200',
    title: 'Rs.200 Stamp Paper',
    image: 'assets/images/stamb.png',
    discription: "₹200",
  ),
  JudicialContent(
    text: 'Stamp Paper 500',
    title: 'Rs.500 Stamp Paper',
    image: 'assets/images/stamb.png',
    discription: "₹500",
  ),
];
