import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';

class EventModel {
  String id;
  CategoryValues categoryValue;
  String title;
  String description;
  DateTime date;
  bool isFavorite;
  EventModel({
    this.id = '',
    this.isFavorite = false,
    required this.categoryValue,
    required this.title,
    required this.description,
    required this.date,
  });
  static List<EventModel> get dummyData => List.generate(
        10,
        (index) {
          return EventModel(
            isFavorite: index % 2 == 0,
            categoryValue: CategoryValues.bookClub,
            title: 'Event ${index + 1}',
            description: 'This is a description for event ${index + 1}.',
            date: DateTime.now().add(Duration(days: index)),
          );
        },
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'category': categoryValue.name,
      'isFavorite': isFavorite,
    };
  }

  static EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      categoryValue:
          CategoryValues.values.firstWhere((e) => e.name == json['category']),
      isFavorite: json['isFavorite'] as bool,
    );
  }
}
