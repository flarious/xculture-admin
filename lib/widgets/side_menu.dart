import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/pages/Authentication/authentication.dart';
import 'package:xculture_admin/routing/routes.dart';
import 'package:xculture_admin/widgets/TheText.dart';
import 'package:xculture_admin/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: ListView(
              children: [
                if(ResponsiveWidget.isSmallScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        SizedBox(width: _width / 48),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          //child: Image.asset("assets/icons/X3.png"),
                        ),
                        Flexible(
                          child: TheTextWidget(
                            text: "Xculture",
                            size: 20,
                            weight: FontWeight.bold,
                            color: red,
                          ),
                        ),
                        SizedBox(width: _width / 48),
                      ],
                    ),
                  
                SizedBox(height: 30,
                  ),
               ],
              ),
                //Divider(color: grey.withOpacity(.9), ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItemRoutes.map((itemName) => SideMenuItem(
                          itemName: itemName == AuthenticationPageRoute ? "Log Out" : itemName,
                          onTap: () {
                            if(itemName == AuthenticationPageRoute){
                                Get.offAll(()=> AuthenticationPage());
                            }
                            if (!menuController.isActive(itemName)) {
                              menuController.changeActiveItemTo(itemName);
                              if(ResponsiveWidget.isSmallScreen(context))
                              Get.back();
                              navigationController.navigateTo(itemName);
                            }
                          },
                      )).toList(),
                )
              ],
            ),
          );
  }
}