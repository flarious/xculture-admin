import 'package:flutter/material.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/info_card.dart';


class OverviewCardsMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

   return FutureBuilder<StatData>(
      future: API.getOverviewStat(),
      builder: (context, AsyncSnapshot<StatData> snapshot) {
        if (snapshot.hasData) {
          return  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                    children: [
                      InfoCard(
                        title: "Total User",
                        value: snapshot.data!.firstData.toString(),
                        onTap: () {},
                        topColor: Colors.orange,
                      ),
                      SizedBox(
                        width: _width / 64,
                      ),
                      InfoCard(
                        title: "Total Forum",
                        value: snapshot.data!.secondData.toString(),
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
                        title: "Total Event",
                        value: snapshot.data!.thirdData.toString(),
                        topColor: Colors.orange,
                        onTap: () {},
                      ),
                      SizedBox(
                        width: _width / 64,
                      ),
                      InfoCard(
                        title: "Total Community",
                        value: snapshot.data!.fourthData.toString(),
                        onTap: () {}, 
                        topColor: Colors.orange,
                      ),
                  ],)
            ],
          );
        }
        else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}