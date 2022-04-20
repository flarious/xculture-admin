
import 'package:flutter/material.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/bar_chart.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/forum_data.dart';
import 'package:xculture_admin/pages/Report/report_data.dart';
import 'package:xculture_admin/widgets/theText.dart';

class ReportGraphSmall extends StatelessWidget {

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
                            text: "Amount Report in Server",
                            size: 20,
                            weight: FontWeight.bold,
                            color: grey,
                          ),
                          Container(
                              width: 600,
                              height: 200,
                              child: SimpleBarChart.withSampleData()),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Row(
                            children: [
                              ReportData(
                                title: "Forum's Report",
                                amount: "5",
                              ),
                              ReportData(
                                title: "Event's Report",
                                amount: "20",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ReportData(
                                title: "Community's Report",
                                amount: "44",
                              ),
                              ReportData(
                                title: "All Report",
                                amount: "69",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}