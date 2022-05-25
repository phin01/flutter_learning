import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// The Firebase project contains:
//    - A email/password authentication service
//    - A Firestore database with the following collections:
//        - users: User data (email, name, avatar URL)
class FirebaseService {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  final String usersCollection = 'users';
  Map? currentUser;

  FirebaseService();

  // FirebaseAuth service uses Email/Password authentication
  // This method returns a bool with the authentication result
  // And also assigns the user's data to the currentUser map
  Future<bool> userLogin({required String email, required String password}) async {

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null) {
        currentUser = await getUserData(uid: userCredential.user!.uid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    } 

  }

  // Firestore collection 'users' has 3 fields:
  //    - (String) email
  //    - (String) image
  //    - (String) name
  // This method will return the fields as a map based on the provided UID
  Future<Map> getUserData({required String uid}) async {
    DocumentSnapshot doc = await _db.collection(usersCollection).doc(uid).get();
    return doc.data() as Map;
  }

  
  Future<bool> registerUser({required String name, required String email, required String password, required File image}) async {

    try {
      // Create the user in Firebase with provided email/password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      // From generated user credentials, get the UID
      // It will be stored in the 'users' collection and used as path for uploaded avatar
      String uid = userCredential.user!.uid;

      // Generate a unique filename for the avatar and upload it to Firebase storage
      String filename = Timestamp.now().millisecondsSinceEpoch.toString() + p.extension(image.path);
      UploadTask task = _storage.ref('images/$uid/$filename').putFile(image);
      
      // Once the upload is complete, get the uploaded image's URL
      String? fileURL;
      await task.then((snapshot) async {
        fileURL = await snapshot.ref.getDownloadURL();
      });

      // After all data has been collected, create an entry in the 'users' collection
      // with all data related to the newly-registered user 
      await _db.collection(usersCollection).doc(uid).set({
        'name': name,
        'email': email,
        'image': fileURL,
      });
      
      // if nothing has failed thus far, return true
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}