import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:evently_app/UI/main_screen/models/event_model.dart';

class FirebaseServices {
  static CollectionReference<EventModel> getCollection() {
    CollectionReference<EventModel> collection = FirebaseFirestore.instance
        .collection('Events')
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }

  static Future<void> addEvent(EventModel event) async {
    CollectionReference<EventModel> collection = getCollection();
    DocumentReference<EventModel> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  static Future<List<EventModel>> getAllEvents(
      {required CategoryValues? categoryValue}) async {
    CollectionReference<EventModel> collection = getCollection();
    QuerySnapshot<EventModel> snapshot = await collection
        .orderBy('date')
        .where('category', isEqualTo: categoryValue?.name)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
