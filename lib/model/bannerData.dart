class BannerModel{

  final String category;
  final String title;
  final DateTime dateTime;

  BannerModel({required this.category, required this.title, required this.dateTime});

}

final List<BannerModel>progressData=[
  BannerModel(category: "In Prgress", title: "Ui desinging", dateTime: DateTime.now()),
  BannerModel(category: "In Prgress", title: "State Management", dateTime: DateTime.now()),
  BannerModel(category: "In Prgress", title: "Develop more", dateTime: DateTime.now()),
];