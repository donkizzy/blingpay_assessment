import 'package:blingpay_assesment/features/post/data/repositories/post_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';




void main() {

  late PostRepository postRepository ;
  late FakeFirebaseFirestore firebaseFirestore ;
  
  setUp((){
    firebaseFirestore = FakeFirebaseFirestore();
    postRepository = PostRepository(firebaseFireStore: firebaseFirestore);
  });

  test('fetchPosts returns empty list when no documents found', () async {
    final posts = await postRepository.fetchPosts();

    expect(posts, isEmpty);
  });

  test('fetchPosts returns list of PostModel from documents', () async {
    final List<Map<String, dynamic>> mockDocs = [
      {
        "thumbnail": "https://firebasestorage.googleapis.com/v0/b/blinqpost.appspot.com/o/blinqpayapp_283378730_5263452000387376_8497039804548532757_n.jpg?alt=media&token=445db31e-533b-4feb-b2dc-a7b7950a8ae9",
        "userId": "JfpBYheu4zLhNMv539OR",
        "id": "2",
        "no_media": false,
        "link": "https://firebasestorage.googleapis.com/v0/b/blinqpost.appspot.com/o/blinqpayapp_283378730_5263452000387376_8497039804548532757_n.jpg?alt=media&token=445db31e-533b-4feb-b2dc-a7b7950a8ae9",
        "username": "Alex",
        "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna.",
        "timestamp": 1653513552,
        "video": false
      }
    ];

    for (var doc in mockDocs) {
      await firebaseFirestore.collection('post').add(doc);
    }

    final posts = await postRepository.fetchPosts();

    expect(posts.length, mockDocs.length);
    expect(posts.first.thumbnail, mockDocs[0]['thumbnail']);
    expect(posts.first.userId, mockDocs[0]['userId']);
  });

}
