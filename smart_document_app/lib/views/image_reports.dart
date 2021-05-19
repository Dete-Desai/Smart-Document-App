import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_document_app/services/crud.dart';

class ImageReports extends StatefulWidget {
  @override
  _ImageReportsState createState() => _ImageReportsState();
}

class _ImageReportsState extends State<ImageReports> {
  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot smartSnapshot;

  Widget SmartDocList() {
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(itemBuilder: null)
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    crudMethods.getData().then((result) {
      smartSnapshot = result;
    });
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
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white54,
              child: Text(
                "Uploaded Image Reports",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
