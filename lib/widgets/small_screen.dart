import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromARGB(255, 245, 245, 245),
      
    );
  }
}