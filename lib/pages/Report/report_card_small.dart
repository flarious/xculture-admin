
import 'package:flutter/material.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/info_card_small.dart';

class ReportCardSmallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Container(
      height: 400,
      child: Column(
        children: [
                    InfoCardSmallScreen(
                      title: "Total Forum Report",
                      value: "7",
                      onTap: () {},
                      ),
                    SizedBox(
                      height: _width / 64,
                      ),
                    InfoCardSmallScreen(
                      title: "Total Event Report",
                      value: "4",
                      onTap: () {},
                      ),
                    SizedBox(
                      height: _width / 64,
                      ),
                    InfoCardSmallScreen(
                      title: "Total Community Report",
                      value: "3",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: _width / 64,
                    ),
        ],
      ),
    );
  }
}