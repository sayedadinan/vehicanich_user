import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicanich/data/models/message.dart';

class ChatService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> sendMessage(String receiverId, String message) async {
    try {
      final String currentUserId = firebaseAuth.currentUser!.uid;
      final String currentUserEmail =
          firebaseAuth.currentUser!.email.toString();
      final Timestamp timestamp = Timestamp.now();
      print('this is from chatservice $receiverId');
      Message newMessage = Message(
          senderId: currentUserId,
          sendEmail: currentUserEmail,
          receiverId: receiverId,
          message: message,
          timestamp: timestamp);
      List<String> ids = [currentUserId, receiverId];
      ids.sort();
      String chatRoomId = ids.join("_");
      await firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .add(newMessage.toJson());
    } catch (e) {
      // Handle the exception here
      print('Error sending message: $e');
      // You can re-throw the exception or handle it based on your requirement
      throw e;
    }
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    try {
      List<String> ids = [userId, otherUserId];
      ids.sort();
      print('this ids $ids');
      dynamic chatRoomId = ids.join("_");
      return firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .orderBy('timestamp', descending: false)
          .snapshots();
    } catch (e) {
      // Handle the exception here
      print('Error fetching messages: $e');
      // Return an empty stream or throw the error based on your requirement
      return Stream.empty();
    }
  }
}
