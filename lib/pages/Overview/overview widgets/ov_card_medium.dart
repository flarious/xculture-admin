import 'package:flutter/material.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/info_card.dart';


class OverviewCardsMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
              children: [
                InfoCard(
                  title: "Total User",
                  value: "57",
                  onTap: () {},
                  topColor: Colors.orange,
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Total Forum",
                  value: "49",
                  topColor: Colors.orange,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
              ],
            ),
            Row(
              children: [
                InfoCard(
                  title: "Total Community",
                  value: "3",
                  topColor: Colors.orange,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Total Events",
                  value: "15",
                  onTap: () {}, 
                  topColor: Colors.orange,
                ),
            ],)
      ],
    );
  }
}