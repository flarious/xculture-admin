import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/widgets/TheText.dart';


class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const VerticalMenuItem({Key ?key, 
  required this.itemName, 
  required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? grey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    child: Container(
                      width: 3,
                      height: 72,
                      color: Colors.white,
                    ),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: menuController.returnIconFor(itemName),
                          ),
                          if (!menuController.isActive(itemName))
                            Flexible(
                                child:TheTextWidget(
                                  text: itemName,
                                  color: menuController.isHovering(itemName)
                                  ? Color.fromARGB(255, 226, 99, 99): grey,
                                  size: 18,
                                  weight: FontWeight.normal,
                            )) 
                          else
                            Flexible(
                                child: TheTextWidget(
                                  text: itemName,
                                  color: Color.fromARGB(255, 255, 156, 156),
                                  size: 18,
                                  weight: FontWeight.bold,
                            ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
