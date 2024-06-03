import 'package:cloud_firestore/cloud_firestore.dart';

class CloudService{
  // add user profile info
  Future saveProfileData(String firstname, String secondname, int age, int phoneNumber, String userId) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'firstname': firstname,
        'secondname': secondname,
        'age': age,
        'phone_number': phoneNumber,
      }
    );
  }
  // get user into 
   Future getUserData(String userId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document = await firestore.collection('users').doc(userId).get();
    return document;
    
  }
}

