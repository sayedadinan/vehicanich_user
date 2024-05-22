import 'dart:developer';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageChanging {
  profileImageChanging(String imagePath, Uint8List profileImageUnit) async {
    try {
      log('worked');
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('user_profile_image')
          .child(imagePath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await reference.putData(profileImageUnit, meta);
      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      log('there is a error in image changing area$e');
      return 'there is a error when changing profile photo';
    }
  }
}
