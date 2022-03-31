// import 'package:flutter/material.dart';
// //import 'package:get/get.dart';

// const int largeScreenSize = 1366;
// const int medScreenSize = 768;
// const int smallScreenSize = 360;
// const int customScreenSize = 1100;

// class ResponsiveWidget extends StatelessWidget {
//   final Widget largeScreen;
//   final Widget medScreen;
//   final Widget smallScreen;
//   //final Widget customScreen;

//   const ResponsiveWidget(
//   { Key? key,
//   required this.largeScreen,
//   required this.medScreen,
//   required this.smallScreen,
//   //required this.customScreen
//   }) : super(key: key);

// static bool isSmallScreen(BuildContext context)=>
// MediaQuery.of(context).size.width < smallScreenSize;

// static bool isMedScreen(BuildContext context)=>
// MediaQuery.of(context).size.width >= medScreenSize &&
// MediaQuery.of(context).size.width < largeScreenSize;

// static bool isLargeScreen(BuildContext context)=>
// MediaQuery.of(context).size.width >= largeScreenSize;

// static bool isCustomScreen(BuildContext context)=>
// MediaQuery.of(context).size.width >= medScreenSize &&
// MediaQuery.of(context).size.width <= customScreenSize;
 
 
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       double _width = constraints.maxWidth;
//       if(_width >= largeScreenSize){
//         return largeScreen;
//       }
//       else if(_width < largeScreenSize && _width >= medScreenSize){
//         return medScreen ?? largeScreen;
//       }
//       else{
//         return smallScreenSize ?? largeScreen;
//       }
//     });
//   }
// }
import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallSceenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  //final Widget customScreen;


  const ResponsiveWidget({
    Key ? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen, 
    //required this.customScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < mediumScreenSize;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumScreenSize &&
        MediaQuery.of(context).size.width < largeScreenSize;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largeScreenSize;
  }


  static bool isCustomSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= customScreenSize &&
        MediaQuery.of(context).size.width >= mediumScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= largeScreenSize) {
          return largeScreen;
        } else if (constraints.maxWidth < largeScreenSize &&
            constraints.maxWidth >= mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}