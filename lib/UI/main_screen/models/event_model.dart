import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';

class EventModel {
  String id;
  CategoryValues categoryValue;
  String title;
  String description;
  DateTime date;
  bool isFavorite;
  double? latitude;
  double? longitude;
  EventModel({
    this.id = '',
    this.isFavorite = false,
    required this.categoryValue,
    required this.title,
    required this.description,
    required this.date,
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'category': categoryValue.name,
      'isFavorite': isFavorite,
      'latitude': latitude,
      'longitude': longitude,
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
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }
}
