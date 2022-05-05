import 'package:flutter/material.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'info_card_small.dart';


class OverviewCardsSmallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

   return FutureBuilder<StatData>(
      future: API.getOverviewStat(),
      builder: (context, AsyncSnapshot<StatData> snapshot) {
        if (snapshot.hasData) {
          return  Container(
            height: 400,
            child: Column(
              children: [
                          InfoCardSmallScreen(
                            title: "Total User",
                            value: snapshot.data!.firstData.toString(),
                            onTap: () {},
                            ),
                          SizedBox(
                            height: _width / 64,
                            ),
                          InfoCardSmallScreen(
                            title: "Total Forum",
                            value: snapshot.data!.secondData.toString(),
                            onTap: () {},
                            ),
                          SizedBox(
                            height: _width / 64,
                            ),
                          InfoCardSmallScreen(
                            title: "Total Event",
                            value: snapshot.data!.thirdData.toString(),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: _width / 64,
                          ),
                          InfoCardSmallScreen(
                            title: "Total Community",
                            value: snapshot.data!.fourthData.toString(),
                            onTap: () {}, 
                          ),     
              ],
            ),
          );
        }
        else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}