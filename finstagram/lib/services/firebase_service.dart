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

}