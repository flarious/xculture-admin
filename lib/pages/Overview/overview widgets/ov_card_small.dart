import 'package:flutter/material.dart';
import 'info_card_small.dart';


class OverviewCardsSmallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Container(
      height: 400,
      child: Column(
        children: [
                    InfoCardSmallScreen(
                      title: "Total User",
                      value: "57",
                      onTap: () {},
                      ),
                    SizedBox(
                      height: _width / 64,
                      ),
                    InfoCardSmallScreen(
                      title: "Total Forum",
                      value: "49",
                      onTap: () {},
                      ),
                    SizedBox(
                      height: _width / 64,
                      ),
                    InfoCardSmallScreen(
                      title: "Total Community",
                      value: "3",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: _width / 64,
                    ),
                    InfoCardSmallScreen(
                      title: "Total Events",
                      value: "15",
                      onTap: () {}, 
                    ),     
        ],
      ),
    );
  }
}