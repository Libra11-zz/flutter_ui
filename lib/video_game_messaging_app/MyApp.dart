import 'package:flutter/material.dart';
import 'package:flutter_ui/video_game_messaging_app/pages/landing_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:ThemeData(
          primarySwatch: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage()
      )
    );
  }
}