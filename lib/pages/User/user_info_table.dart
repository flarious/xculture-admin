import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/routing/routes.dart';
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
                text: "User List",
                color: Colors.black,
                size: 25,
                weight: FontWeight.bold,
              ),
            ],
          ),
          
          FutureBuilder<List<User>>(
            future: API.getUsers(),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasData) {
                return DataTable2(
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
                      label: Text('Status'),
                    ),
                    DataColumn(
                      label: Text('Banned'),
                    ),
                    DataColumn(
                      label: Text('Actions'),
                    ),
                  ],
                  rows: snapshot.data!.map((user) => DataRow(
                    cells: 
                      [
                        DataCell(
                          TheTextWidget(
                            text: user.name, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: user.email, 
                            size: 14, 
                            color: Colors.black, 
                            weight: FontWeight.normal
                          )
                        ),
                        DataCell(
                          Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: user.type == "banned" ? Colors.red : Colors.green, width: .5),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6
                            ),
                            child: TheTextWidget(
                              text: user.type,
                              color: user.type == "banned" ? Colors.red.withOpacity(.7) : Colors.green.withOpacity(.7),
                              size: 16,
                              weight: FontWeight.bold,
                            )
                          )
                        ),
                        DataCell(
                          TheTextWidget(
                            text: user.banned.toString(), 
                            size: 14, 
                            color: Color.fromARGB(255, 151, 0, 0), 
                            weight: FontWeight.bold
                          )
                        ),
                        DataCell(
                          user.type == "banned" ? 
                          ElevatedButton(
                            onPressed: () {
                              if (user.type == "banned") {
                                showDialog(
                                  context: context, 
                                  builder: (context) => AlertDialog(
                                    title: const Text("Unban"),
                                    content: const Text("Do you want to unban this user?"),
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
                                          var success = await API.unbanUser(user.id);
                                          if (success) {
                                            Navigator.pop(context);
                                            navigationController.navigateTo(UserPageRoute);
                                          }
                                        }, 
                                        child: const Text("Yes", style: TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                    elevation: 24.0,
                                  )
                                );
                              }
                            }, 
                            child: const Text("Unban")
                          ) : Container()
                        )
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
