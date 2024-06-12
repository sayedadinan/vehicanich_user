import 'dart:developer';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/data/services/image_service/image_converting.dart';
part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc()
      : super(ImageInitial(
          storedImagePath: '',
          imagePath: '',
          profileImageUnit: null,
        )) {
    on<ProfileImageAdding>(profileImageadding);
    on<ProfileImageSaving>(profileImagesaving);
    on<ProfileImageFetching>(profileImagefetchng);
  }
  profileImageadding(ProfileImageAdding event, Emitter<ImageState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final profileImagePath =
          await picker.pickImage(source: ImageSource.gallery);
      Uint8List profileImageUnit = await profileImagePath!.readAsBytes();
      emit(ImageInitial(
          storedImagePath: '',
          imagePath: profileImagePath.path,
          profileImageUnit: profileImageUnit));
    } catch (e) {
      log('there is some error in image adding area $e');
    }
  }

  profileImagesaving(ProfileImageSaving event, Emitter<ImageState> emit) async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final userId = await UserDocId().getUserId();
      final profileImage = await ImageChanging()
          .profileImageChanging(state.imagePath, state.profileImageUnit!);
      await db
          .collection(ReferenceKeys.users)
          .doc(userId)
          .update({"profileImagePath": profileImage});
      log('successfully added');
    } catch (e) {
      log('there is a error in image saving area $e');
    }
  }

  profileImagefetchng(
      ProfileImageFetching event, Emitter<ImageState> emit) async {
    try {
      if (event.isGoogleSignIn) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        emit(ImageInitial(
            imagePath: googleUser!.photoUrl!,
            profileImageUnit: state.profileImageUnit,
            storedImagePath: state.storedImagePath));
      } else {
        final storedImagePath = await UserRepository().userProfileFetching();
        emit(ImageInitial(
            imagePath: state.imagePath,
            profileImageUnit: state.profileImageUnit,
            storedImagePath: storedImagePath));
      }
    } catch (e) {
      log('there is a problem in profile fetching area $e');
    }
  }
}
