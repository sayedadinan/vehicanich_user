import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/image_bloc/bloc/image_bloc.dart';

class ImageChanging {
  licenceImageChanging(BuildContext context) async {
    try {
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('licence_image')
          .child(BlocProvider.of<ImageBloc>(context).state.imagePath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await reference.putData(
          BlocProvider.of<ImageBloc>(context).state.profileUpdationImageUnit!,
          meta);
      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      return 'there is a error when changing licence photo';
    }
  }
}
