part of 'user_detail_bloc.dart';

sealed class UserDetailsEvent {}

class ProfilePictureAddButtonPressed extends UserDetailsEvent {}

class EditingButtonPressed extends UserDetailsEvent {}

class UserDataLoaded extends UserDetailsEvent {
  final String email;

  UserDataLoaded({required this.email});
}

class UserDetailsEditingButtonClicked extends UserDetailsEvent {}
