import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectapp/Drawer/Profile.dart';
import 'package:miniprojectapp/Drawer/About.dart';
import 'package:miniprojectapp/Drawer/Wishlist.dart';
import 'package:miniprojectapp/Drawer/Settings.dart';
import 'package:miniprojectapp/Drawer/Order.dart';
import 'package:miniprojectapp/Services/AuthService.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:miniprojectapp/homescreenhelper/categories.dart';
import 'package:miniprojectapp/homescreenhelper/gridlist.dart';

class HomeScreen extends StatefulWidget {
final User finaluser;
HomeScreen(this.finaluser);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  _listItem={
      'assets/images/icons/type1.png',
      'assets/images/icons/type2.png',
      'assets/images/icons/type3.png',
      'assets/images/icons/type4.png',
      'assets/images/icons/type5.png',
  };
  @override
  Widget build(BuildContext context) {
    //carousel images
    Widget _frontimage=new Container(
      height:180,
      child:Carousel(
        boxFit:BoxFit.cover,
        images: [
          AssetImage('assets/images/carousel/img1.jpg'),
          AssetImage('assets/images/carousel/img2.png'),
          AssetImage('assets/images/carousel/img3.jpg')
        ],
        autoplay: true,
        indicatorBgPadding: 2.0,
      )
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle:true ,
          elevation: 0,
          title: Text("Agrozon",
          style: TextStyle(
          color:Colors.white,
          ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(
              Icons.search,
              color:Colors.white,
            ),
                onPressed: (){}),
            IconButton(icon: Icon(
              Icons.shopping_cart,
              color:Colors.white,
            ), onPressed: (){})
          ],
        ),
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/jhondoe.png"),
                        radius: 50,
                      ),
                      SizedBox(height: 20,),
                      Text(widget.finaluser.phoneNumber,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),),
                    ],
                  ),
                ),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.person),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(widget.finaluser)));},
                ),
                ListTile(
                  title: Text("Orders"),
                  leading: Icon(Icons.shopping_bag),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Order()));},
                ),
                ListTile(
                  title: Text("Wishlist"),
                  leading: Icon(Icons.favorite),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist()));},
                ),
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));},
                ),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.info),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));},
                ),
                Spacer(),
                Text("App Version : 1.0.0", style: TextStyle(fontSize: 12),),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),

  body:ListView(
    children: [
      _frontimage,
      Padding(padding:EdgeInsets.all(8.0),
        child: Text('categories',
        style: TextStyle(
          fontSize:20.0,
          fontWeight: FontWeight.bold,
        ),),
      ),
      catogories(),
    //  ListTile(),
      Container(
        padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
        height: 400,
          child: gridlist()),
    ],
  ),
  /*      body:SafeArea(
          child:Container(
            child: Column(
               children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child:Container(
                    height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(250.0),
                          image:DecorationImage(
                          image: AssetImage('assets/images/i1.jpeg'),
                                ),
                        ),
                                padding: EdgeInsets.all(10.0),
                            child:Text(
                              'Shop Now',
                              style: TextStyle(
                                color: Colors.black,fontWeight:FontWeight.bold,
                              ),
                            ),
                          
                                ),
                        ),
              //  SizedBox(height:,),
                Expanded(
                    child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        padding: EdgeInsets.all(20),
                        mainAxisSpacing: 20,
                        children: _listItem.map((item)=>Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child:Container(
                              height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image:DecorationImage(
                                        image:AssetImage(item),
                                        fit: BoxFit.cover,
                                     ),
                                ),
                            ),
                        ),).toList(),
                  ),
                ),
            ],
            ),
          ),
        ),*/
      ),
    );
  }
} 