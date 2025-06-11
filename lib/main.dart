import 'package:blind_box/db_blind/db_blind.dart';
import 'package:blind_box/pages/blind_add/blind_add_binding.dart';
import 'package:blind_box/pages/blind_add/blind_add_view.dart';
import 'package:blind_box/pages/blind_details/blind_details_binding.dart';
import 'package:blind_box/pages/blind_details/blind_details_view.dart';
import 'package:blind_box/pages/blind_first/blind_first_binding.dart';
import 'package:blind_box/pages/blind_first/blind_first_view.dart';
import 'package:blind_box/pages/blind_second/blind_second_binding.dart';
import 'package:blind_box/pages/blind_second/blind_second_view.dart';
import 'package:blind_box/pages/blind_tab/blind_tab_binding.dart';
import 'package:blind_box/pages/blind_tab/blind_tab_view.dart';
import 'package:blind_box/pages/need_restart/need_restart_binding.dart';
import 'package:blind_box/pages/need_restart/need_restart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xffff9d00);
Color bgColor = const Color(0xfff2f2f2);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBlind().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Boxs,
      initialRoute: '/blindTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Boxs = [
  GetPage(name: '/blindRestart', page: () => const NeedRestartView(), binding: NeedRestartBinding()),
  GetPage(name: '/blindFirst', page: () => BlindFirstPage(), binding: BlindFirstBinding()),
  GetPage(name: '/blindSecond', page: () => BlindSecondPage(), binding: BlindSecondBinding()),
  GetPage(name: '/blindAdd', page: () => BlindAddPage(),  binding: BlindAddBinding()),
  GetPage(name: '/blindDetails', page: () => BlindDetailsPage(), binding: BlindDetailsBinding()),
  GetPage(name: '/blindTab', page: () => BlindTabPage(), binding: BlindTabBinding()),
];
