part of 'user_detail_bloc.dart';

sealed class UserDetailsState {}

class InitialUserDetailsState extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UserModel user;

  UserDetailsLoaded({required this.user});
}

class NavigateToEditingPage extends UserDetailsState {}
