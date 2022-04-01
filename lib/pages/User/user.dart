import 'package:flutter/material.dart';
import 'package:xculture_admin/widgets/theText.dart';

class UserPage extends StatelessWidget {
 // const OverviewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TheTextWidget(
        text: "User",
        color: Colors.black,
        size: 22,
        weight: FontWeight.bold,),
    );
  }
}