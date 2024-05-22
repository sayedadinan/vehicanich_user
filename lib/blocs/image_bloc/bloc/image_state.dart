part of 'image_bloc.dart';

sealed class ImageState {
  final String imagePath;
  final Uint8List? profileImageUnit;
  final String storedImagePath;
  ImageState({
    required this.storedImagePath,
    required this.imagePath,
    required this.profileImageUnit,
  });
}

final class ImageInitial extends ImageState {
  ImageInitial({
    required super.imagePath,
    required super.profileImageUnit,
    required super.storedImagePath,
  });
}
