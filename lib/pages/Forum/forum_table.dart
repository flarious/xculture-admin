import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/widgets/TheText.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

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
            children: const [
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
          FutureBuilder<List<Forum>>(
            future: API.getForums(),
            builder: (context, AsyncSnapshot<List<Forum>> snapshot) {
              if (snapshot.hasData) {
                return DataTable2(
                  columnSpacing: 3,
                  horizontalMargin: 1,
                  minWidth: 200,
                  columns: const [
                    DataColumn2(
                      label: Text("Title Name"),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Owner'),
                    ),
                    DataColumn(
                      label: Text('Last Updated'),
                    ),
                    DataColumn(
                      label: Text('Viewed'),
                    ),
                    DataColumn(
                      label: Text('Liked'),
                    ),
                  ],
                  rows: snapshot.data!.map((forum) => DataRow(
                    cells: 
                      [
                        DataCell(
                          TheTextWidget(
                            text: forum.title, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: forum.owner.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(forum.lastUpdated).toLocal()), 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: forum.viewed.toString(), 
                            size: 14, 
                            color: Color.fromARGB(255, 151, 0, 0), 
                            weight: FontWeight.bold
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: forum.liked.toString(), 
                            size: 14, 
                            color: Color.fromARGB(255, 151, 0, 0), 
                            weight: FontWeight.bold
                          )
                        ),
                      ]
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
