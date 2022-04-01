
import 'package:flutter/material.dart';
import 'package:xculture_admin/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({ Key ?key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SideMenu()
        ),
        Expanded(
          flex: 5,
          child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          ))
      ], 
    );
  }
}