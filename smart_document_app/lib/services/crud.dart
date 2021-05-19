import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(smartData) async {
    FirebaseFirestore.instance.collection("imageUploads").add(smartData).catchError((error){
      print(error);
    });
    FirebaseFirestore.instance.collection("fileUploads").add(smartData).catchError((error){
      print(error);
    });
  }

  getData() async{
    return await FirebaseFirestore.instance.collection("imageUploads").doc();
  }
}
