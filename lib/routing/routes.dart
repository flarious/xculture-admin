const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const UserPageDisplayName = "User";
const UserPageRoute = "/User";

const ForumPageDisplayName = "Forum";
const ForumPageRoute = "/Forum";

const EventPageDisplayName = "Events";
const EventPageRoute = "/Events";

const CommunityPageDisplayName = "Community";
const CommunityPageRoute = "/Community";

const ReportPageDisplayName = "Report";
const ReportPageRoute = "/Report";


const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(UserPageDisplayName, UserPageRoute),
 MenuItem(ForumPageDisplayName, ForumPageRoute),
 MenuItem(EventPageDisplayName, EventPageRoute),
 MenuItem(CommunityPageDisplayName, CommunityPageRoute),
 MenuItem(ReportPageDisplayName, ReportPageRoute),
 MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
