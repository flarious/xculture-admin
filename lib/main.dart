import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xculture_admin/controllers/sidemenu_controller.dart';
import 'package:xculture_admin/layout.dart';
import 'package:xculture_admin/pages/home.dart';
import 'package:get/get.dart';
void main() {
  Get.put(SideMenuController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DashBoard',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
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
      home: SiteLayout(),
      //
    );
  }
}
