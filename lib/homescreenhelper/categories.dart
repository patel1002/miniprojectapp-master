import 'package:flutter/material.dart';

class catogories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width:200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Categories(
            image_location: 'assets/images/icons/type1.png',

          ),
          Categories(
            image_location: 'assets/images/icons/type2.png',
          ),
          Categories(
            image_location: 'assets/images/icons/type3.png',
          ),
          Categories(
            image_location: 'assets/images/icons/type4.png',
          ),
          Categories(
            image_location: 'assets/images/icons/type5.png',
          ),
          Categories(
            image_location: 'assets/images/icons/type6.png',
          ),
/*          Padding(padding: EdgeInsets.all(5.0)),

             Container(
              width: 100,
           child:  InkWell(
              child: ListTile(
                title:Image.asset('assets/images/icons/type1.png'),
                subtitle:Text (''),
              ),

            onTap: (){},
      ),      ),
          InkWell(
            child: ListTile(
              title:Image.asset('assets/images/icons/type2.png'),
              subtitle:Text (''),
            ),
            onTap: (){},
          ),
          InkWell(
            child: ListTile(
              title:Image.asset('assets/images/icons/type3.png'),
              subtitle:Text (''),
            ),
            onTap: (){},
          ),
          InkWell(
            child: ListTile(
              title:Image.asset('assets/images/icons/type4.png'),
              subtitle:Text (''),
            ),
            onTap: (){},
          ),
          InkWell(
            child: ListTile(
              title:Image.asset('assets/images/icons/type5.png'),
              subtitle:Text (''),
            ),
            onTap: (){},
          ),
          InkWell(
            child: ListTile(
              title:Image.asset('assets/images/icons/type6.png'),
              subtitle:Text (''),
            ),
            onTap: (){},
          ),*/
        ],
      ),
    );
  }
}
class Categories extends StatelessWidget{
  final String image_location;

  Categories({
    this.image_location});
  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.all(2.0),
   child:InkWell(
     onTap: (){},
     child:Container(
       width: 100,
         child: ListTile(
           title: Image.asset(
             image_location,
             width: 100,
             height: 80,
           ),
         ),
     ),
   ),
   );
  }
}
