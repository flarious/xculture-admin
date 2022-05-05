import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class ReportedEventTable extends StatelessWidget {
  const ReportedEventTable({ Key? key, required this.eventId }) : super(key: key);

  final String eventId;
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
                text: "Reported Event",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text("Delete And Ban"),
                      content: const Text("You confirm that this user has violated our rules and need to be punished?\nThis event will be deleted and the user will be banned."),
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
                            var success = await API.deleteEventAndBan(eventId);
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
                child: const Text("Accept")
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text("Reject"),
                      content: const Text("You confirm that this user doesn't do anything wrong?\nAll of the reports against this event will be deleted"),
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
                            var success = await API.deleteRejectedReports(eventId);
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
                child: const Text("Reject")
              )
            ],
          ),
          FutureBuilder<ReportedEvent>(
            future: API.getReportedEvent(eventId),
            builder: (context, AsyncSnapshot<ReportedEvent> snapshot) {
              if (snapshot.hasData) {
                return DataTable2(
                  columnSpacing: 5,
                  horizontalMargin: 1,
                  minWidth: 200,
                  columns: [
                    DataColumn2(
                      label: Text("Event Name"),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Location'),
                    ),
                    DataColumn(
                      label: Text('Event Description'),
                    ),
                    DataColumn(
                      label: Text('Host'),
                    ),
                    DataColumn(
                      label: Text('Create Date'),
                    ),
                    DataColumn(
                      label: Text('Last Update'),
                    ),
                    DataColumn(
                      label: Text('Event Date'),
                    ),
                  ],
                  
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.location, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.body, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: snapshot.data!.host.name, 
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
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(snapshot.data!.eventDate).toLocal()), 
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
