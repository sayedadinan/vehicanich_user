import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordEmailSend {
  FirebaseAuth auth = FirebaseAuth.instance;
  sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }
}
