import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/widgets/theText.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:intl/intl.dart';

/// Example without a datasource


class ReportDetailTable extends StatelessWidget {
  const ReportDetailTable({ Key? key, required this.itemId }) : super(key: key);

  final String itemId;

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
                text: "Report List",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
            ],
          ),
          FutureBuilder<List<ReportDetail>>(
            future: API.getReportDetail(itemId),
            builder: (context, AsyncSnapshot<List<ReportDetail>> snapshot) {
              if (snapshot.hasData) {
                return DataTable2(
                  columnSpacing: 5,
                  horizontalMargin: 1,
                  minWidth: 200,
                  columns: [
                    DataColumn2(
                      label: Text("Topics"),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Additional Detail'),
                    ),
                    DataColumn(
                      label: Text('Reporter'),
                    ),
                    DataColumn(
                      label: Text('Report Date'),
                    ),
                  ],
                  rows: snapshot.data!.map((report) => DataRow(
                      cells: [
                        DataCell(
                          TheTextWidget(
                            text: report.topics, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: report.detail,
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: report.reporter.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(report.reportDate).toLocal()), 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                      ],
                    )
                  ).toList()
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
