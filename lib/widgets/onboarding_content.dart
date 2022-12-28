class UnbordingContent {
  String image;

  String title;
  String text;
  String discription;
  String number;

  UnbordingContent(
      {required this.image,
      required this.title,
      required this.text,
      required this.discription,
      required this.number});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      text: 'Most',
      title: 'Secured',
      image: 'assets/images/image1.png',
      discription: "Delivery in town",
      number: '1'),
  UnbordingContent(
      text: 'Delivered by',
      title: 'Qualified',
      image: 'assets/images/image2.png',
      discription: "in house delivery partners",
      number: '2'),
  UnbordingContent(
      text: 'Get your parcel',
      title: 'Delivered',
      image: 'assets/images/image3.png',
      discription: "anywhere in your city",
      number: '3'),
];
