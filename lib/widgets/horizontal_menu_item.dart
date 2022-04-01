import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/widgets/theText.dart';

class HorizontalSideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalSideMenuItem({ Key ?key, 
  required this.itemName, 
  required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
                  onTap: onTap,
                  onHover: (value){
                    value ?
                    menuController.onHover(itemName) : 
                    menuController.onHover("not hovering");
                  },
                  child: Obx(() => Container(
                    color: menuController.isHovering(itemName) ? 
                    Colors.grey.withOpacity(.1) : Colors.transparent,
                    child: Row(
                      children: [
                        Visibility(
                          visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                            width: 6,
                            height: 40,
                            color: Colors.black,
                          ),
                        ),
                       SizedBox(width:_width / 88),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName),
                        ),
                        if(!menuController.isActive(itemName))
                        Flexible(child: TheTextWidget(text: itemName , color: menuController.isHovering(itemName) ? Colors.black : Colors.grey,size: 18,weight: FontWeight.bold,))

                        else
                        Flexible(child: TheTextWidget(text: itemName , color:  Colors.black , size: 18, weight: FontWeight.bold,))

                      ],
                    ),
                  ))
                );
  }
}