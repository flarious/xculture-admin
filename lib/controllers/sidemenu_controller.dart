import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/routing/routes.dart';

class SideMenuController extends GetxController {
  static SideMenuController instance = Get.find();
  var activeItem = overviewPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);

      case UserPageRoute:
        return _customIcon(Icons.people_alt_sharp, itemName);

      case ForumPageRoute:
        return _customIcon(Icons.book, itemName);

      case EventPageRoute:      
        return _customIcon(Icons.location_on_rounded, itemName);

      case CommunityPageRoute:      
        return _customIcon(Icons.comment, itemName);

     case ReportPageRoute:
        return _customIcon(Icons.report, itemName);

      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 25, color: Colors.grey);

    return Icon(
      icon,
      color: isHovering(itemName) ? Color.fromARGB(255, 236, 94, 94) : grey,
    );
  }
}
