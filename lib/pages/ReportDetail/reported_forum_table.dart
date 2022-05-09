import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/pages/ReportDetail/report_detail.dart';
import 'package:xculture_admin/routing/routes.dart';
import 'package:xculture_admin/widgets/theText.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

/// Example without a datasource

class ReportedForumTable extends StatelessWidget {
  const ReportedForumTable({ Key? key, required this.forumId }) : super(key: key);

  final String forumId;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: grey, width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6), color: grey.withOpacity(.1), blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              TheTextWidget(
                text: "Reported Forum",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: const Text("Delete And Ban"),
                        content: const Text("You confirm that this user has violated our rules and need to be punished?\nThis forum will be deleted and the user will be banned."),
                        actions: [
                          TextButton(
                            onPressed: (){
                              //No
                              Navigator.pop(context);
                            }, 
                            child: const Text("No", style: TextStyle(color: Colors.grey)),
                          ),
                          TextButton(
                            onPressed: () async {
                              var success = await API.deleteForumAndBan(forumId);
                              if(success) {
                                Navigator.pop(context);
                                navigationController.navigateTo(ReportPageRoute);
                              }
                            }, 
                            child: const Text("Yes", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                        elevation: 24.0,
                      )
                    );
                  }, 
                  child: const Text("Accept"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(15),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: const Text("Reject"),
                        content: const Text("You confirm that this user doesn't do anything wrong?\nAll of the reports against this forum will be deleted"),
                        actions: [
                          TextButton(
                            onPressed: (){
                              //No
                              Navigator.pop(context);
                            }, 
                            child: const Text("No", style: TextStyle(color: Colors.grey)),
                          ),
                          TextButton(
                            onPressed: () async {
                              var success = await API.deleteRejectedReports(forumId);
                              if(success) {
                                Navigator.pop(context);
                                navigationController.navigateTo(ReportPageRoute);
                              }
                            }, 
                            child: const Text("Yes", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                        elevation: 24.0,
                      )
                    );
                  }, 
                  child: const Text("Reject"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: EdgeInsets.all(15)
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder<ReportedForum>(
            future: API.getReportedForum(forumId),
            builder: (context, AsyncSnapshot<ReportedForum> snapshot) {
              if (snapshot.hasData) {
                return DataTable2(
                  columnSpacing: 5,
                  horizontalMargin: 1,
                  minWidth: 200,
                  columns: [
                    DataColumn2(
                      label: Text("Title"),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Subtitle'),
                    ),
                    DataColumn(
                      label: Text('Content'),
                    ),
                    DataColumn(
                      label: Text('Author'),
                    ),
                    DataColumn(
                      label: Text('Create Date'),
                    ),
                    DataColumn(
                      label: Text('Last Update'),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.title, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.subtitle, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.content, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.author.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(snapshot.data!.createDate).toLocal()), 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(snapshot.data!.updateDate).toLocal()), 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                      ],
                    )
                  ]
                );
              }
              else {
                return const CircularProgressIndicator();
              }
            }
          )
        ],
      ),
    );
  }
}
