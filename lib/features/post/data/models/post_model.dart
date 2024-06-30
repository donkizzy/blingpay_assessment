import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String? thumbnail;
  final String? userId;
  final String? id;
  final bool? noMedia;
  final String? link;
  final String? username;
  final String? description;
  final int? timestamp;
  final bool? video;

  PostModel({
    this.thumbnail,
    this.userId,
    this.id,
    this.noMedia,
    this.link,
    this.username,
    this.description,
    this.timestamp,
    this.video,
  });

  factory PostModel.fromSnapshot(QueryDocumentSnapshot snapshot) => PostModel(
    thumbnail: (snapshot.data() as Map<String,dynamic>).containsKey('thumbnail') ? snapshot.get("thumbnail") : '',
    userId: snapshot.get("userId"),
    id: snapshot.get("id"),
    noMedia: snapshot.get("no_media"),
    link:(snapshot.data() as Map<String,dynamic>).containsKey('link') ? snapshot.get("link") : '',
    username: snapshot.get("username"),
    description: snapshot.get("description"),
    timestamp: snapshot.get("timestamp"),
    video: (snapshot.data() as Map<String,dynamic>).containsKey('video') ? bool.parse(snapshot.get("video").toString()) : null,
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "userId": userId,
    "id": id,
    "no_media": noMedia,
    "link": link,
    "username": username,
    "description": description,
    "timestamp": timestamp,
    "video": video,
  };
}