import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:miniprojectapp/Screens/productdes.dart';

    class gridlist extends StatefulWidget {
      @override
      _gridlistState createState() => _gridlistState();
    }

    class _gridlistState extends State<gridlist> {
      int item=6;
      @override
      Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
              child:imggrid(),
        );
      }

      Widget imggrid(){

        return GridView.builder(
          itemCount: item,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context,index){
           return imagegrid(index);
        });
      }
    }

    
    class imagegrid extends StatefulWidget {
      int _index;
      imagegrid(int index){
        this._index=index;
      }
      @override
      _imagegridState createState() => _imagegridState();
    }
    
    class _imagegridState extends State<imagegrid> {

      Uint8List img;
      Reference imgreference=FirebaseStorage.instance.ref().child("gridlist");
      
      getImage(){
      imgreference.child("img_${widget._index}.jpg").getData(5*1024*1024).then((data){
        this.setState(() {
          img=data;
        });
      }).catchError((error){

      });
      }

      Widget decideGridImage(){
        if(img==null){
           return Center(child: Text("loading"));
        }else{
          return Container(
            //  height: 200,
              child: Image.memory(img));
        }
      }

      @override
      void initState(){
        super.initState();
        getImage();
      }

      @override
      Widget build(BuildContext context) {
        return Card(
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: (){
               Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new  productdes(image: img,)));
              },
              child: decideGridImage(),
            ),
          ),
        );
      }
    }
