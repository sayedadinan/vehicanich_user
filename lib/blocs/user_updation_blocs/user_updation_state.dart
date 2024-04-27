part of 'user_updation_bloc.dart';

sealed class UserDetailsUpdationState {}

class InitialUserDetailsEditing extends UserDetailsUpdationState {}

class UserDetailsLoading extends UserDetailsUpdationState {}

class UserDetailsLoaded extends UserDetailsUpdationState {
  final UserModel user;

  UserDetailsLoaded({required this.user});
}

class UserDetailsUpdationButton extends UserDetailsUpdationState {}
