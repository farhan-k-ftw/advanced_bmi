import 'package:bmi_claculator_og/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0321),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: Colors.pink,
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
          bodyMedium: const TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(elevation: 0,centerTitle: true,color :Color(0xff0a0321),),),
      home:  Home(),
    );
  }
}




