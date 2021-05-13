import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(smartData) async {
    FirebaseFirestore.instance.collection("imageUploads").add(smartData).catchError((error){
      print(error);
    });
  }
}
