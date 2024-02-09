class DataModel{

  final String title;
  final String description;
  final DateTime dateTime;

  DataModel({required this.title, required this.description, required this.dateTime});


}

final List<DataModel>dataModel=[
  DataModel(title: "Meeting", description: "jhfjhjdjhj", dateTime: DateTime.now()),
  DataModel(title: "Meeting", description: "jhfjhjdjhj", dateTime: DateTime.now()),
  DataModel(title: "Meeting", description: "jhfjhjdjhj", dateTime: DateTime.now()),

];