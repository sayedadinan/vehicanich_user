import 'dart:developer';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc()
      : super(ImageInitial(imagePath: '', profileUpdationImageUnit: null)) {
    on<ProfileImageAdding>(profileImageadding);
  }
  profileImageadding(ProfileImageAdding event, Emitter<ImageState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final profileImagePath =
          await picker.pickImage(source: ImageSource.gallery);
      Uint8List profileImageUnit = await profileImagePath!.readAsBytes();
      emit(ImageInitial(
          imagePath: profileImagePath.path,
          profileUpdationImageUnit: profileImageUnit));
    } catch (e) {
      log('there is some error in image adding area $e');
    }
  }
}
