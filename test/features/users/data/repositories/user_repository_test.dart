import 'package:blingpay_assesment/features/users/data/repositories/user_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserRepository userRepository ;
  late FakeFirebaseFirestore firebaseFireStore ;

  setUp((){
    firebaseFireStore = FakeFirebaseFirestore();
    userRepository = UserRepository(firebaseFireStore: firebaseFireStore);
  });

  test('fetchUsers returns empty list when no documents found', () async {

    final users = await userRepository.fetchUsers();
    expect(users, isEmpty);
  });

  test('fetchUsers returns list of UserModel from documents', () async {
    final List<Map<String, dynamic>> mockDocs = [
      {
        "userId": "2tJgiVZWQRczkDqqjzrG",
        "username": "Test",
        "name": " Brooklyn Simmons",
        "photo": "https://firebasestorage.googleapis.com/vo/b/blynq-13e9a.appspot.com/o/default_user_img.png?alt=media&token=8190d4c3-8a93-4476-a37b-bc3faa74e71d, bio: Always curious to learn new stuff",
        "bio": 'Always curious to learn new stuff'
      }
    ];

    for (var doc in mockDocs) {
      await firebaseFireStore.collection('users').add(doc);
    }

    final users = await userRepository.fetchUsers();

    expect(users.length, mockDocs.length);
    expect(users.first.name, mockDocs[0]['name']);
    expect(users.first.username, mockDocs[0]['username']);
  });


}
