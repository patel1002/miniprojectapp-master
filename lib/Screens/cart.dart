import 'dart:typed_data';
import 'package:miniprojectapp/Screens/productdes.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  Uint8List image1;

  cart({this.image1,});
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
            ListTile(
              title: Image.memory(widget.image1),
            ),
        ],
      ),
    );
  }
}


