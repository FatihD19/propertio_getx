import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertio_getx/app/constants/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.interTextTheme().apply(
              bodyColor: primaryTextColor, displayColor: primaryTextColor),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: bgColor1,
            elevation: 0,
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
