import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/UI/auth/models/user_model.dart';
import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  static Future<UserModel?> userLogin(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.uid != null) {
      UserModel? userModel = await getUserInfo(userCredential.user!.uid);
      return userModel;
    }
    return null;
  }

  static Future<UserModel> userSignUp(
      {required String email,
      required String password,
      required String name}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel user =
        UserModel(email: email, name: name, uid: userCredential.user!.uid);
    await addNewUser(user);
    return user;
  }

  static CollectionReference<UserModel> getUserCollection() {
    CollectionReference<UserModel> collection =
        FirebaseFirestore.instance.collection('Users').withConverter<UserModel>(
              fromFirestore: (snapshot, options) =>
                  UserModel.fromJson(snapshot.data() ?? {}),
              toFirestore: (value, options) => value.toJson(),
            );
    return collection;
  }

  static Future<void> addNewUser(UserModel userModel) async {
    CollectionReference<UserModel> collection = getUserCollection();
    DocumentReference<UserModel> doc = collection.doc(userModel.uid);

    await doc.set(userModel);
  }

  static Future<UserModel?> getUserInfo(String uid) async {
    CollectionReference<UserModel> collection = getUserCollection();
    DocumentSnapshot<UserModel> user = await collection.doc(uid).get();
    return user.data();
  }

  static CollectionReference<EventModel> getCollection() {
    CollectionReference<EventModel> collection = getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
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

  static Future<void> deleteEvent(EventModel event) async {
    CollectionReference<EventModel> collection = getCollection();
    DocumentReference<EventModel> doc = collection.doc(event.id);
    await doc.delete();
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

  static Future changeEventFav(EventModel eventModel, bool favValue) async {
    CollectionReference<EventModel> collection = getCollection();
    await collection.doc(eventModel.id).update({'isFavorite': favValue});
  }

  static Stream<List<EventModel>> getFavEvents() {
    CollectionReference<EventModel> collection = getCollection();
    Stream<QuerySnapshot<EventModel>> snapshot = collection
        .orderBy('date')
        .where('isFavorite', isEqualTo: true)
        .snapshots();
    return snapshot.map(
      (event) => event.docs
          .map(
            (e) => e.data(),
          )
          .toList(),
    );
  }

  static Future<UserModel> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    UserModel user = UserModel(
      email: googleUser?.email ?? '',
      name: googleUser?.displayName ?? 'No Name',
      uid: FirebaseAuth.instance.currentUser!.uid,
    );
    await addNewUser(user);
    return user;
  }
}
