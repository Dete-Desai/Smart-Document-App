import 'package:flutter/material.dart';
import 'package:smart_document_app/services/crud.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String subjectMatter, senderName, receiverName;

  CrudMethods crudMethods = new CrudMethods();

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
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.file_upload))
        ],
      ),
      body: Container(
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
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(6)),
              width: MediaQuery.of(context).size.width,
              child: Icon(Icons.camera),
            ),
            SizedBox(height: 8),
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
