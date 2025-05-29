class UserModel {
  String email;
  String name;
  String uid;
  UserModel({required this.email, required this.name, required this.uid});
  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'uid': uid};
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'], name: json['name'], uid: json['uid']);
  }
}
