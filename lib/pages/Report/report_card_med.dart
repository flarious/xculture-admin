import 'package:flutter/material.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/info_card.dart';


class ReportCardMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
              children: [
                InfoCard(
                  title: "Total forum Report",
                  value: "7",
                  onTap: () {},
                  topColor: Color.fromARGB(255, 255, 51, 0),
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Total Event Report",
                  value: "4",
                  topColor: Colors.orange,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Total Community Report",
                  value: "3",
                  topColor: Colors.yellow,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
              ],
            ),
            // Row(
            //   children: [
            //     InfoCard(
            //       title: "Total Community Report",
            //       value: "3",
            //       topColor: Colors.orange,
            //       onTap: () {},
            //     ),
            //     SizedBox(
            //       width: _width / 64,
            //     ),
            // ],)
      ],
    );
  }
}