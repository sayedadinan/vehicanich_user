part of 'user_detail_bloc.dart';

sealed class UserDetailsState {
  final String userName;
  final String email;
  final String? profileImagePath;
  UserDetailsState(
      {required this.userName,
      required this.email,
      required this.profileImagePath});
}

class InitialUserDetailsState extends UserDetailsState {
  InitialUserDetailsState(
      {required super.userName,
      required super.email,
      required super.profileImagePath});
}

class UserDetailsLoading extends UserDetailsState {
  UserDetailsLoading(
      {required super.userName,
      required super.email,
      required super.profileImagePath});
}

class UserDetailsLoaded extends UserDetailsState {
  final UserModel user;

  UserDetailsLoaded(
      {required this.user,
      required super.userName,
      required super.email,
      required super.profileImagePath});
}

class NavigateToEditingPage extends UserDetailsState {
  NavigateToEditingPage(
      {required super.userName,
      required super.email,
      required super.profileImagePath});
}
