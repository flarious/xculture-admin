import 'package:flutter/cupertino.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/routing/router.dart';
import 'package:xculture_admin/routing/routes.dart';


Navigator localNavigator() =>   Navigator(
      key: navigationController.navigatorKey,
      initialRoute: overviewPageRoute,
      onGenerateRoute: generateRoute,
    );



