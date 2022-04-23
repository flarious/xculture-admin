import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/widgets/theText.dart';
//import 'package:flutter/material/scaffold.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      //backgroundColor:Color.fromARGB(0, 219, 196, 101),
      backgroundColor: Colors.transparent,
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                
                // Container(
                //   //color: Colors.amber,
                //   padding: const EdgeInsets.only(left: 2),
                //   child: Image.asset(
                //     "assets/icons/X3.png",
                //     width: 54,
                //     height: 54,
                //   ),
                // )
              ],
            )
          : IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 255, 55, 55),
                size: 35,
              ),
              onPressed: () {
                key.currentState?.openDrawer();
              }),
      elevation: 0,
      title: Row(children: [
        Visibility(
            child: TheTextWidget(
              text: "Xculture",
              color: red,
              size: 22,
              weight: FontWeight.bold,
        )),
        Expanded(child: Container()),
        // IconButton(
        //   icon: Icon(
        //     Icons.settings,
        //     color: Colors.black54,
        //   ),
        //   onPressed: () {},
        // ),
        Stack(
          children: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.notification_add,color:Colors.black45,)),
              
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 207, 63),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color.fromARGB(255, 238, 100, 90),width: 2 )),
                ))
              ],    
        ),
        Container(
          width: 1,
          height: 22,
          color: Colors.grey[100],
        ),
        SizedBox(width: 24,),
        TheTextWidget(
          text: "admin1", 
          size: 15, 
          color: Colors.grey, 
          weight: FontWeight.bold
          ),
        SizedBox(height:16),
        SizedBox(width:16),
        Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 216, 216, 216),
          borderRadius: BorderRadius.circular(60)),
          child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Icon(Icons.person_outline,color: Color.fromARGB(255, 78, 78, 78),),
            ),
          ) ,
        )
      ]),
      iconTheme:IconThemeData(
        color: Color.fromARGB(221, 49, 47, 47)),
      
    );
