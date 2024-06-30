import 'package:blingpay_assesment/features/users/data/models/user_model.dart';
import 'package:blingpay_assesment/features/users/data/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  late final UserRepository _appRepository;

  UserCubit({UserRepository? appRepository}) : super(UserInitial()) {
    _appRepository = appRepository ?? UserRepository(firebaseFireStore: FirebaseFirestore.instance);
  }

  void fetchUsers() async {
    try {
      emit(FetchUsersLoading());
      var users = await _appRepository.fetchUsers();
      emit(FetchUsersSuccess(users: users));
    } catch (e) {
      emit(FetchUsersError(error: e.toString()));
    }
  }
}
