import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/widgets/theText.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Example without a datasource

class ForumTable extends StatelessWidget {
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
                text: "Forum List",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
            ],
          ),
          DataTable2(
              columnSpacing: 3,
              horizontalMargin: 1,
              minWidth: 200,
              columns: [
                DataColumn2(
                  label: Text("Title Name"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Owner'),
                ),
                DataColumn(
                  label: Text('Date'),
                ),
                DataColumn(
                  label: Text('Viewed'),
                ),
                DataColumn(
                  label: Text('Liked'),
                ),
              ],
              rows: List<DataRow>.generate(
                  15,
                  (index) => DataRow(cells: [
                        DataCell(TheTextWidget(
                          text: "Bacon",
                          size: 14,
                          weight: FontWeight.normal,
                          color: Colors.black,
                        )),
                        DataCell(TheTextWidget(
                          text: "Nut Shokun simp",
                          size: 14,
                          weight: FontWeight.normal,
                          color: Colors.black,
                        )),
                        DataCell(
                          TheTextWidget(
                            text: "01-01-2022",
                            color: Colors.black,
                            weight: FontWeight.normal,
                            size: 14,
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: "2",
                            color: Color.fromARGB(255, 151, 0, 0),
                            weight: FontWeight.bold,
                            size: 14,
                          ),
                        ),
                        DataCell(
                          TheTextWidget(
                            text: "2",
                            color: Color.fromARGB(255, 151, 0, 0),
                            weight: FontWeight.bold,
                            size: 14,
                          ),
                        ),
                      ]
                    )
                  )
                ),
        ],
      ),
    );
  }
}
