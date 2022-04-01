import 'package:flutter/material.dart';
import 'package:xculture_admin/widgets/theText.dart';

class OverviewPage extends StatelessWidget {
 // const OverviewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TheTextWidget(
        text: "overviwe",
        color: Colors.black,
        size: 22,
        weight: FontWeight.bold,),
    );
  }
}