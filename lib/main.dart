import 'package:flutter/material.dart';
import 'package:news_feed/Pages/lib_result.dart';
import 'package:news_feed/Pages/lib_welcome.dart';
import 'package:news_feed/Pages/price_screen.dart';

import 'Pages/testPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        //BookResults.id: (context) => BookResults(),
        WelcomeScreen.id: (context) => WelcomeScreen()
      },
    );
  }
}
