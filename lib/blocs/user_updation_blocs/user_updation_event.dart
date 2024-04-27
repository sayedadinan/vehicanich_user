part of 'user_updation_bloc.dart';

sealed class UserDetailsUpdationEvent {}

class ProfilePictureAddButtonPressed extends UserDetailsUpdationEvent {}

class UserDataFetched extends UserDetailsUpdationEvent {
  final String email;

  UserDataFetched({required this.email});
}

class UserDetailsUpdateButton extends UserDetailsUpdationEvent {
  final UserModel user;

  UserDetailsUpdateButton({required this.user});
}
