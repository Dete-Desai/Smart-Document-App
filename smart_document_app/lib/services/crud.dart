import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods{

  Future<void> adddata(blogData) async{

    Firestore.instance.collection("imageuploads").add(blogData).catchError((e){
      print(e);
    });
  }
}

