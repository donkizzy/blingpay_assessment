import 'package:blingpay_assesment/features/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppRepository {
  final FirebaseFirestore firebaseFireStore;

  AppRepository({required this.firebaseFireStore});

  Future<List<UserModel>> fetchUsers() async {
    final ref =  await  firebaseFireStore.collection("users").get();
    final users = ref.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    return users;
  }
}
