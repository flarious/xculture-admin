import 'package:flutter/material.dart';
import 'package:xculture_admin/pages/Authentication/authentication.dart';
import 'package:xculture_admin/pages/Community/community.dart';
import 'package:xculture_admin/pages/Event/event.dart';
import 'package:xculture_admin/pages/Forum/forum.dart';
import 'package:xculture_admin/pages/Overview/overview.dart';
import 'package:xculture_admin/pages/Report/report.dart';
import 'package:xculture_admin/pages/User/user.dart';
import 'package:xculture_admin/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case UserPageRoute:
      return _getPageRoute(UserPage());
    case ForumPageRoute:
      return _getPageRoute(ForumPage());
    case EventPageRoute:
      return _getPageRoute(EventPage());   
    case CommunityPageRoute:
      return _getPageRoute(CommunityPage()); 
    case ReportPageRoute:
      return _getPageRoute(ReportPage());
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}