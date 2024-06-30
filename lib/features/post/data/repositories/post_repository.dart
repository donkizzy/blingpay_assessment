import 'package:blingpay_assesment/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  final FirebaseFirestore firebaseFireStore;

  PostRepository({required this.firebaseFireStore});

  Future<List<PostModel>> fetchPosts() async {
    final ref =  await  firebaseFireStore.collection("post").get();
    final posts = ref.docs.map((doc) => PostModel.fromSnapshot(doc)).toList();
    return posts;
  }
}
