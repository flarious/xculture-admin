import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/pages/Report/report_table.dart';
import 'package:xculture_admin/pages/ReportDetail/report_detail_table.dart';
import 'package:xculture_admin/pages/ReportDetail/reported_commu_table.dart';
import 'package:xculture_admin/pages/ReportDetail/reported_event_table.dart';
import 'package:xculture_admin/pages/ReportDetail/reported_forum_table.dart';
import 'package:xculture_admin/routing/routes.dart';
import 'package:xculture_admin/widgets/theText.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({ Key? key, required this.reportDetail }) : super(key: key);

  final Reported reportDetail;

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
            )
          ),
          Expanded(
            child: ListView(
              children: [
                if (reportDetail.type == "forum")
                  ReportedForumTable(forumId: reportDetail.id)
                else if (reportDetail.type == "event")
                  ReportedEventTable(eventId: reportDetail.id)
                else if (reportDetail.type == "community")
                  ReportedCommuTable(commuId: reportDetail.id),
                ReportDetailTable(itemId: reportDetail.id)
              ],
            ),
          )
        ],
    );
  }
}