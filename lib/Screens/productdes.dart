import 'dart:typed_data';
import 'package:miniprojectapp/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class productdes extends StatefulWidget {

  Uint8List image;

  productdes({this.image,});
  @override
  _productdesState createState() => _productdesState();
}

class _productdesState extends State<productdes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: Image.memory(widget.image),
          ),
          Row(
          children:<Widget>[
            Expanded(
              child:MaterialButton(
                color: Colors.green,
                onPressed: (){},
                child: Text('Buy now',
                style: TextStyle(
                  color: Colors.white,
                ),),
              )
            ),
            new IconButton(icon: Icon(Icons.add_shopping_cart), onPressed:(){
              uploadcart();
            }),
            new IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}),
          ],
          ),
        ],
      ),

    );
  }

 Future uploadcart() async{
    var img=MemoryImage(widget.image);
    Reference storagereference=FirebaseStorage.instance.ref().child("cart");
    UploadTask imageupload=storagereference.putFile(img);
  }
}

