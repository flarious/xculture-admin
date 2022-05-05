import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/widgets/theText.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../helpers/api.dart';

/// Example without a datasource

class EventTable extends StatelessWidget {
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
                text: "Event List",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
            ],
          ),
          FutureBuilder<List<Event>>(
            future: API.getEvents(),
            builder: (context, AsyncSnapshot<List<Event>> snapshot) {
              if (snapshot.hasData) {
                return DataTable2(
                  columnSpacing: 3,
                  horizontalMargin: 1,
                  minWidth: 200,
                  columns: const [
                    DataColumn2(
                      label: Text("Event Name"),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Owner'),
                    ),
                    DataColumn(
                      label: Text('Last Updated'),
                    ),
                    DataColumn(
                      label: Text('Event Date'),
                    ),
                    DataColumn(
                      label: Text('Location'),
                    ),
                    DataColumn(
                      label: Text('Interested'),
                    ),
                  ],
                  rows: snapshot.data!.map((event) => DataRow(
                    cells: 
                      [
                        DataCell(
                          TheTextWidget(
                            text: event.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: event.owner.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(event.lastUpdated).toLocal()), 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: DateFormat('MMMM dd, yyyy – HH:mm a').format(DateTime.parse(event.eventDate).toLocal()), 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: event.location, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: event.interested.toString(), 
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
