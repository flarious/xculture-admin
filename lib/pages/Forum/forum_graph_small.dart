
import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/pages/Forum/forum_data.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/bar_chart.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/stat_data.dart';
import 'package:xculture_admin/widgets/theText.dart';

class ForumGraphSmall extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 6),
                        color: grey.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  border: Border.all(color: grey, width: .5),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TheTextWidget(
                            text: "Amount of Forum in Server",
                            size: 20,
                            weight: FontWeight.bold,
                            color: grey,
                          ),
                          Container(
                            width: 600,
                            height: 200,
                            child: FutureBuilder<List<GraphData>>(
                              future: API.getForumGraph(),
                              builder: (context, AsyncSnapshot<List<GraphData>> snapshot) {
                                if (snapshot.hasData) {
                                  return SimpleBarChart.fromData(snapshot.data!);
                                }
                                else {
                                  return const CircularProgressIndicator();
                                }
                              }
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 1,
                      color: grey,
                    ),
                    Container(
                      height: 260,
                      child: FutureBuilder<StatData>(
                        future: API.getForumStat(),
                        builder: (context, AsyncSnapshot<StatData> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    StatDataCard(
                                      title: "This Month",
                                      amount: snapshot.data!.firstData.toString(),
                                    ),
                                    StatDataCard(
                                      title: "Last Months",
                                      amount: snapshot.data!.secondData.toString(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                Row(
                                  children: [
                                    StatDataCard(
                                      title: "Last 3 Months",
                                      amount: snapshot.data!.thirdData.toString(),
                                    ),
                                    StatDataCard(
                                      title: "All Forum",
                                      amount: snapshot.data!.fourthData.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                          else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
  }
}