import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/bar_chart.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/stat_data.dart';
import 'package:xculture_admin/pages/Report/report_bar_chart.dart';
import 'package:xculture_admin/pages/Report/report_data.dart';
import 'package:xculture_admin/widgets/theText.dart';


class ReportGraphLarge extends StatelessWidget {

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
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TheTextWidget(
                            text: "Amount of Report in Server",
                            size: 20,
                            weight: FontWeight.bold,
                            color: grey,
                          ),
                          Container(
                            width: 600,
                            height: 200,
                            child: FutureBuilder<List<GraphData>>(
                              future: API.getReportedGraph(),
                              builder: (context, AsyncSnapshot<List<GraphData>> snapshot) {
                                if (snapshot.hasData) {
                                  return SimpleBarChart.fromData(snapshot.data!);
                                }
                                else {
                                  return const CircularProgressIndicator();
                                }
                              }
                            )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 120,
                      color: grey,
                    ),
                    Expanded(
                      child: FutureBuilder<StatData>(
                        future: API.getReportedStat(),
                        builder: (context, AsyncSnapshot<StatData> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    StatDataCard(
                                      title: "Forums' Report",
                                      amount: snapshot.data!.firstData.toString(),
                                    ),
                                    StatDataCard(
                                      title: "Events' Report",
                                      amount: snapshot.data!.secondData.toString(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                Row(
                                  children: [
                                    StatDataCard(
                                      title: "Communities' Report",
                                      amount: snapshot.data!.thirdData.toString(),
                                    ),
                                    StatDataCard(
                                      title: "All Report",
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