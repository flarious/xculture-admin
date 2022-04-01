import 'package:flutter/material.dart';
import 'package:xculture_admin/widgets/theText.dart';

class EventPage extends StatelessWidget {
  //const EventPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TheTextWidget(
        text: "Event",
        color: Colors.black,
        size: 22,
        weight: FontWeight.bold,),
    );
  }
}