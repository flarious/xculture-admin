import 'package:flutter/material.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/widgets/large_screen.dart';
import 'package:xculture_admin/widgets/side_menu.dart';
import 'package:xculture_admin/widgets/small_screen.dart';
import 'package:xculture_admin/widgets/top_nav_bar.dart';

class SiteLayout extends StatelessWidget {
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true ,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(child: SideMenu(),),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: LargeScreen(),),
    );
  }
}