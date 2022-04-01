
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
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isActive ? red : Colors.grey, width: .5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TheTextWidget(text: title, size: 24, weight: FontWeight.w300, color: isActive ? red : grey,),
            TheTextWidget(text: value, size: 24, weight: FontWeight.bold, color: isActive ? red : Colors.black,)

          ],)
        ),
      ),
    );
  }
}
