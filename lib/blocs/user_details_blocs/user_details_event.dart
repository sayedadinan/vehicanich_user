part of 'user_detail_bloc.dart';

sealed class UserDetailsEvent {}

class ProfilePictureAddButtonPressed extends UserDetailsEvent {}

class EditingButtonPressed extends UserDetailsEvent {}

class UserDetailsFetching extends UserDetailsEvent {
  UserDetailsFetching();
}

class UserDetailsEditingButtonClicked extends UserDetailsEvent {}
