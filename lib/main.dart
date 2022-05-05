import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xculture_admin/controllers/navigation_controller.dart';
import 'package:xculture_admin/controllers/sidemenu_controller.dart';
import 'package:xculture_admin/firebase/firebase_options.dart';
import 'package:xculture_admin/layout.dart';
import 'package:xculture_admin/pages/404_error/not_found_page.dart';
import 'package:xculture_admin/pages/Authentication/authentication.dart';
import 'package:xculture_admin/pages/Report/report.dart';
import 'package:xculture_admin/pages/User/user.dart';
import 'package:xculture_admin/pages/home.dart';
import 'package:get/get.dart';
import 'package:xculture_admin/routing/routes.dart';

void main() async {
  Get.put(SideMenuController());
  Get.put(NavigationController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: AuthenticationPageRoute,
      // unknownRoute: GetPage(name: "Not Found", page: ()=> PageNotFound(),transition: Transition.fadeIn),
      // getPages: [
      //   GetPage(name: rootRoute, page: ()=> SiteLayout()),
      //   GetPage(name: AuthenticationPageRoute, page: ()=> AuthenticationPage()),
      // ],
      debugShowCheckedModeBanner: false,
      title: 'XCulture DashBoard',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ).apply(
          bodyColor: Colors.black
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS:FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android:FadeUpwardsPageTransitionsBuilder()
        }),
        primaryColor: Colors.red,
      ),
    home: AuthenticationPage(),
    // home: ReportPage(),
    //home: UserPage(),
    );
  }
}
