part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();
}

final class PostsInitial extends PostsState {
  @override
  List<Object> get props => [];
}

final class FetchPostsLoading extends PostsState {
  @override
  List<Object> get props => [];
}

final class FetchPostsSuccess extends PostsState {
  final List<PostModel> postModels ;

  const FetchPostsSuccess({required this.postModels});
  @override
  List<Object> get props => [postModels];
}

final class FetchPostError extends PostsState {

  final String error ;

  const FetchPostError({required this.error});

  @override
  List<Object> get props => [error];
}
