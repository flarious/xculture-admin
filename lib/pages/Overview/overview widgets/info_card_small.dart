
import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/widgets/theText.dart';

class InfoCardSmallScreen extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCardSmallScreen({Key ? key,
  required this.title,
  required this.value, 
  this.isActive = false,
  required this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isActive ? red : Color.fromARGB(255, 143, 143, 143), width: 0.75),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TheTextWidget(text: title, size: 18, weight: FontWeight.w300, color: isActive ? red : Color.fromARGB(255, 24, 25, 26),),
            TheTextWidget(text: value, size: 18, weight: FontWeight.w300, color: isActive ? red : grey,)
          ],)
        ),
      ),
    );
  }
}
