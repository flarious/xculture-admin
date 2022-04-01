
import 'package:flutter/material.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Row(
              children: [
                InfoCard(
                  title: "Total User",
                  value: "7",
                  onTap: () {},
                  topColor: Colors.orange,
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Total Forum",
                  value: "17",
                  topColor: Colors.orange,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
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
                  value: "32",
                  onTap: () {}, 
                  topColor: Colors.orange,
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Total Events",
                  value: "32",
                  onTap: () {}, 
                  topColor: Colors.orange,
                ),
              ],
            );
  }
}