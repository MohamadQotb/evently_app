import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';

class EventModel {
  final CategoryValues categoryValue;
  final String title;
  final String description;
  final DateTime date;
  final bool isFavorite;
  EventModel({
    required this.isFavorite,
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
}
