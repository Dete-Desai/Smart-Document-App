import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:smart_document_app/services/crud.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String subjectMatter, senderName, receiverName;

  CrudMethods crudMethods = new CrudMethods();

  File imageFile;
  bool _isLoading = false;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final PickedFile = await picker.getImage(source: source);

    setState(() {
      imageFile = File(PickedFile.path);
    });
  }

  uploadImageDetails() async {
    if (imageFile != null) {
      setState(() {
        _isLoading = true;
      });
      //uploading image to firebase storage
      FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;
      Reference ref = firebaseStorageRef
          .ref()
          .child("smartImage" + DateTime.now().toString())
          .child("${randomAlphaNumeric(9)}.jpg");

      UploadTask task = ref.putFile(imageFile);
      var downloadUrl =
          await (await task.whenComplete(() => null)).ref.getDownloadURL();
      print('this is the url ${downloadUrl}');

      Map<String, String> smartMap = {
        "imgUrl": downloadUrl,
        "subjectMatter": subjectMatter,
        "senderName": senderName,
        "receiverName": receiverName,
      };
      crudMethods.addData(smartMap).then((result) {});

      Navigator.pop(context);

      // UploadTask uploadTask = ref.putFile(imageFile);
      // uploadTask.then((res) {
      //   res.ref.getDownloadURL();
      // });
      // print('this is the url ${uploadTask}');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Smart Document App",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            )
          ],
        ),
        backgroundColor: Colors.red,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                uploadImageDetails();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.file_upload))),
        ],
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white54,
                    child: Text(
                      "Upload Image",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[600],
                      ),
                    ),
                  ),
                  Container(
                    child: imageFile != null
                        ? Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image: FileImage(imageFile),
                                  fit: BoxFit.cover,
                                )),
                          )
                        : Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600,
                                borderRadius: BorderRadius.circular(6)),
                            child: Icon(Icons.camera),
                          ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                              onPressed: () {
                                chooseImage(ImageSource.camera);
                              },
                              color: Colors.redAccent,
                              child: Text(
                                "Camera",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                              onPressed: () {
                                chooseImage(ImageSource.gallery);
                              },
                              color: Colors.redAccent,
                              child: Text(
                                "Gallery",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Subject",
                              icon: Icon(Icons.subject),
                            ),
                            onChanged: (val) {
                              subjectMatter = val;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              icon: Icon(Icons.person_add_alt_1),
                            ),
                            onChanged: (val) {
                              senderName = val;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Receivers Name ",
                              icon: Icon(Icons.person_add_alt_1),
                            ),
                            onChanged: (val) {
                              receiverName = val;
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
    );
  }
}
