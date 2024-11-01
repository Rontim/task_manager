import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/main_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Task Manager App', // App title
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
          headlineSmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainNavigation(),
        ),
      ],
    );
  }
}
