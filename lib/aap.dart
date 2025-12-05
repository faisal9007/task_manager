import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login_page.dart';
import 'package:task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.black,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey,
          filled: true,
          hintStyle: TextStyle(color: Colors.brown),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.brown,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: '/Splash Screen',
      routes: {
        '/Splash Screen': (_) => SplashScreen(),
        '/Login Screen': (_) => LoginPage(),
        '/SignUp Scree': (_) => SignUpScreen(),
        '/Main Navigation': (_) => MainNavBarHolderScreen(),
        '/Update Profile Screen': (_) => UpdateProfileScreen(),
      },
    );
  }
}
