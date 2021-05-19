import 'package:flutter/material.dart';
import 'package:smart_document_app/views/file_reports.dart';
import 'package:smart_document_app/views/image_reports.dart';
import 'package:smart_document_app/views/upload_document.dart';
import 'package:smart_document_app/views/upload_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Smart",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            ),
            Text(
              "Document",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            ),
            Text(
              "App",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            )
          ],
        ),
        //backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadImage()));
              },
              child: Icon(Icons.photo_camera_back),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadDocument()));
              },
              child: Icon(Icons.upload_file),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageReports()));
              },
              child: Icon(Icons.image_aspect_ratio_outlined),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            FloatingActionButton(
              heroTag: "btn4",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FileReports()));
              },
              child: Icon(Icons.insert_drive_file),
            ),
          ],
        ),
      ),
    );
  }
}
