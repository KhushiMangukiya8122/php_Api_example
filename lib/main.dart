import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:php_api_project/contoller/provider/weather_provider.dart';
import 'package:php_api_project/views/screens/homepage.dart';
import 'package:php_api_project/views/screens/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode:ThemeMode.system,
        routes: {
          '/': (context) => SplashScreen(),
          'home_page': (context) => HomePage(),
        },
      ),
    ),
  );
}
