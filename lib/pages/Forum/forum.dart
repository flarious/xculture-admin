import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/pages/Forum/forum_graphSmall.dart';
import 'package:xculture_admin/pages/Forum/forum_graph_large.dart';
import 'package:xculture_admin/pages/Forum/forum_table.dart';
import 'package:xculture_admin/pages/Report/report_card_large.dart';
import 'package:xculture_admin/pages/Report/report_card_med.dart';
import 'package:xculture_admin/pages/Report/report_card_small.dart';
import 'package:xculture_admin/pages/Report/report_graph_large.dart';

import 'package:xculture_admin/widgets/theText.dart';

class ForumPage extends StatelessWidget {
 // const OverviewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    // margin: EdgeInsets.only(
                    //     top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: TheTextWidget(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                      color: Color.fromARGB(255, 36, 36, 36),
                    ),
                  ),
              ],
            )
          ),
        Expanded(child: ListView(
          children: [
              if(!ResponsiveWidget.isSmallScreen(context))
                ForumGraphLarge()
              else
              ForumGraphSmall(),
              ForumTable()
          ],
        ),
        )
        ],
    );
  }
}