import 'package:flutter/material.dart';
import 'core/costant/custom_color.dart';
import 'feature/dashboard/screen/dashboard_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Color.fromARGB(255, 242, 242, 247),
        scaffoldBackgroundColor: CustomColor.canvasColor,
        // scaffoldBackgroundColor: Color(0xfff9fafb),

        appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: CustomColor.iconColor),
          actionsIconTheme: IconThemeData(color: CustomColor.iconColor),
          titleTextStyle:  TextStyle(fontSize: 16, color: CustomColor.greenColor, fontWeight: FontWeight.w600,),
        ),

      ),
      title: 'CG Tourism',
      home: DashboardScreen(),
    );
  }
}
