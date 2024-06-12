part of 'image_bloc.dart';

sealed class ImageEvent {}

class ProfileImageAdding extends ImageEvent {}

class ProfileImageSaving extends ImageEvent {
  final BuildContext context;

  ProfileImageSaving({required this.context});
}

class ProfileImageFetching extends ImageEvent {
  final bool isGoogleSignIn;

  ProfileImageFetching({required this.isGoogleSignIn});
}
