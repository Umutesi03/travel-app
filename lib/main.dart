import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget{
  const TravelApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Visit Rwanda',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B5E20),
          primary : const Color(0xFF1B5E20),
          secondary: const Color(0xFF4CAF50),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1B5E20),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B5E20),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}