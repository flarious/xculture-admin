import 'package:flutter/material.dart';
import 'package:xculture_admin/widgets/theText.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/404.png", width: 350,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TheTextWidget(
                text: "Page not found", 
                size: 24, 
                weight: FontWeight.bold,
                color: Colors.black,),
            ],
          )
        ],
      ),
    );
  }
}
