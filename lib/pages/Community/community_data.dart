import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';

class CommuData extends StatelessWidget {
  final String title;
  final String amount;

  const CommuData({Key? key, 
  required this.title, 
  required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "$title \n\n",
                style: TextStyle(color: grey, fontSize: 22)),
            TextSpan(
                text: "$amount",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ])),
    );
  }
}
