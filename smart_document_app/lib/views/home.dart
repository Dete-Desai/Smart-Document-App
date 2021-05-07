import 'package:flutter/material.dart';
import 'package:smart_document_app/views/upload_document.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadDocument()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}