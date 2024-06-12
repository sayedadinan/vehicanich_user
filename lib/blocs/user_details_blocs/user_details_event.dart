part of 'user_detail_bloc.dart';

sealed class UserDetailsEvent {}

class ProfilePictureAddButtonPressed extends UserDetailsEvent {}

class EditingButtonPressed extends UserDetailsEvent {}

class UserDetailsFetching extends UserDetailsEvent {
  UserDetailsFetching(this.isGoogleSignIn);
  final bool isGoogleSignIn;
}

class UserDetailsEditingButtonClicked extends UserDetailsEvent {}
