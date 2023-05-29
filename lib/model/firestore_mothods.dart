// ignore_for_file: duplicate_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreServices {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  static Future<void> addNotes(
      {required String title, required String description}) async {
    FirebaseFirestore.instance.collection('notes').doc().set({
      'title': title,
      'description': description,
      'date': FieldValue.serverTimestamp()
    });
  }

  Future<String> uploadImageToStorage(String childname, final imagefile) async {
    Reference reference = _storage.ref(childname).child(_auth.currentUser!.uid);
    final postId = DateTime.now().microsecondsSinceEpoch;
    reference = reference.child(postId.toString());
    UploadTask uploadTask = reference.putData(imagefile);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadVideoToStorage(String childname, final videofile) async {
    Reference reference = _storage.ref(childname).child(_auth.currentUser!.uid);
    final postId = DateTime.now().microsecondsSinceEpoch;
    reference = reference.child(postId.toString());
    UploadTask uploadTask = reference.putData(videofile);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<void> sendRecommendation({
    required String description,
    required String imageUrl,
    required String videoUrl,
  }) async {
    FirebaseFirestore.instance.collection('recommendations').doc().set({
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'email': FirebaseAuth.instance.currentUser!.email,
      'recommendations': description,
      'image_url': imageUrl,
      'video_url': videoUrl
    });
  }
}
