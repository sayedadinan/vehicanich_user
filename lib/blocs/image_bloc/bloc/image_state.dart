part of 'image_bloc.dart';

sealed class ImageState {
  final String imagePath;
  final Uint8List? profileUpdationImageUnit;
  ImageState({
    required this.imagePath,
    required this.profileUpdationImageUnit,
  });
}

final class ImageInitial extends ImageState {
  ImageInitial({
    required super.imagePath,
    required super.profileUpdationImageUnit,
  });
}
