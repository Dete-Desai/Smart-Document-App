import 'package:flutter/material.dart';

class FileReports extends StatefulWidget {
  @override
  _FileReportsState createState() => _FileReportsState();
}

class _FileReportsState extends State<FileReports> {
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
                "Uploaded File Reports",
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
