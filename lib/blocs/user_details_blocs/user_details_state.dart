part of 'user_detail_bloc.dart';

sealed class UserDetailsState {
  final String userName;
  final String email;

  UserDetailsState({required this.userName, required this.email});
}

class InitialUserDetailsState extends UserDetailsState {
  InitialUserDetailsState({required super.userName, required super.email});
}

class UserDetailsLoading extends UserDetailsState {
  UserDetailsLoading({required super.userName, required super.email});
}

class UserDetailsLoaded extends UserDetailsState {
  final UserModel user;

  UserDetailsLoaded(
      {required this.user, required super.userName, required super.email});
}

class NavigateToEditingPage extends UserDetailsState {
  NavigateToEditingPage({required super.userName, required super.email});
}
