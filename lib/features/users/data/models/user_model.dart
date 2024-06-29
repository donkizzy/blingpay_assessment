import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? username;
  final String? name;
  final String? photo;
  final String? bio;

  UserModel({
    this.userId,
    this.username,
    this.name,
    this.photo,
    this.bio,
  });

  factory UserModel.fromSnapshot(QueryDocumentSnapshot snapshot) => UserModel(
    userId: snapshot.get("userId"),
    username: snapshot.get("username"),
    name: snapshot.get("name"),
    photo: snapshot.get("photo"),
    bio: snapshot.get("bio"),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "name": name,
    "photo": photo,
    "bio": bio,
  };
}
