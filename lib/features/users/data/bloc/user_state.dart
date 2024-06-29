part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();
}

final class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

final class FetchUsersLoading extends UserState {
  @override
  List<Object> get props => [];
}

final class FetchUsersSuccess extends UserState {
  final List<UserModel> users ;

  const FetchUsersSuccess({required this.users});
  @override
  List<Object> get props => [users];
}

final class FetchUsersError extends UserState {

  final String error ;

  const FetchUsersError({required this.error});
  @override
  List<Object> get props => [error];
}
