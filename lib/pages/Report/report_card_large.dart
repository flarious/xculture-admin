import 'package:flutter/material.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/pages/Overview/overview%20widgets/info_card.dart';


class ReportCardLargeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;
    return FutureBuilder<StatData>(
      future: API.getReportedStat(),
      builder: (context, AsyncSnapshot<StatData> snapshot) {
        if (snapshot.hasData) {
          return  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  InfoCard(
                    title: "Total Forum Report",
                    value: snapshot.data!.firstData.toString(),
                    onTap: () {},
                    topColor: Color.fromARGB(255, 255, 51, 0),
                  ),
                  SizedBox(
                    width: _width / 64,
                  ),
                  InfoCard(
                    title: "Total Event Report",
                    value: snapshot.data!.secondData.toString(),
                    topColor: Colors.orange,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: _width / 64,
                  ),
                  InfoCard(
                    title: "Total Community Report",
                    value: snapshot.data!.thirdData.toString(),
                    topColor: Colors.yellow,
                    onTap: () {},
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
        else {
          return const CircularProgressIndicator();
        }
        
      }
    );
    
  }
}