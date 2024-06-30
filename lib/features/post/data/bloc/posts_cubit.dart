import 'package:blingpay_assesment/features/post/data/models/post_model.dart';
import 'package:blingpay_assesment/features/post/data/repositories/post_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  late final PostRepository _postRepository;

  PostsCubit({PostRepository? postRepository}) : super(PostsInitial()) {
    _postRepository = postRepository ?? PostRepository(firebaseFireStore: FirebaseFirestore.instance);
  }

  void fetchPosts()async{
    try{
      emit(FetchPostsLoading());
      var posts = await _postRepository.fetchPosts();
      emit(FetchPostsSuccess(postModels: posts));
    }catch(e){
      emit(FetchPostError(error: e.toString()));
    }
  }
}
