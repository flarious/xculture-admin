import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/pages/Community/community_graph_large.dart';
import 'package:xculture_admin/pages/Community/community_graph_small.dart';
import 'package:xculture_admin/pages/Community/community_table.dart';
import 'package:xculture_admin/widgets/theText.dart';

class CommunityPage extends StatelessWidget {
 // const OverviewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: TheTextWidget(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                      color: Color.fromARGB(255, 36, 36, 36),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
                children: [
                    if(!ResponsiveWidget.isSmallScreen(context))
                      CommuGraphLarge()
                    else
                      CommuGraphSmall(),
                    CommuTable()
                ],
              ),
            )
        ],
    );
  }
}