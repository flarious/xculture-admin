import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/widgets/theText.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Example without a datasource

class UserInfoTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: grey, width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: grey.withOpacity(.1),
              blurRadius: 12)
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
                text: "User Info",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
            ],
          ),
          DataTable2(
              columnSpacing: 10,
              horizontalMargin: 2,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Text("Username"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Email Address'),
                ),
                DataColumn(
                  label: Text('Ranking'),
                ),
                DataColumn(
                  label: Text('Status'),
                ),
              ],
              rows: List<DataRow>.generate(
                  7,
                  (index) => DataRow(cells: [
                        DataCell(
                          TheTextWidget(
                            text: "Yomook Yoyo",
                            size:14,
                            weight: FontWeight.normal,
                            color: Colors.black,)),
                        
                        DataCell(TheTextWidget(
                            text: "YositaBlinks@gmail.com",
                            size:14,
                            weight: FontWeight.normal,
                            color: Colors.black,)),
                        
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TheTextWidget(
                              text: "10.0",
                              color: Colors.black,
                              weight: FontWeight.normal,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 18,
                            ),

                          ],
                        )),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green, width: .5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: TheTextWidget(
                              text: "Normal",
                              color: Colors.green.withOpacity(.7),
                              size: 16,
                              weight: FontWeight.bold,
                            ))),
                      ]))),
        ],
      ),
    );
  }
}
