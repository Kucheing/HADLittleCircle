import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required String username,
    required String fullname,
    required String dob,
    required String address,
    required Uint8List file,
  }) async {
    String resp = "Some Error Occurred";
    try {
      if (username.isNotEmpty && fullname.isNotEmpty && dob.isNotEmpty) {
        String imageUrl = await uploadImageToStorage('profileImage', file);
        await _firestore.collection('userProfile').add({
          'username': username,
          'fullname': fullname,
          'dob': dob,
          'address': address,
          'imageLink': imageUrl,
        });
        resp = 'success';
      } else {
        resp = 'Username, fullame or dob is empty';
      }
    } catch (err) {
      print('Error: $err');
      resp = err.toString();
    }
    return resp;
  }
}
