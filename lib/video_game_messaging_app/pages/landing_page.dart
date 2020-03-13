import 'package:flutter/material.dart';
import 'package:flutter_ui/video_game_messaging_app/common/app_background.dart';
import 'package:flutter_ui/video_game_messaging_app/common/horizontal_tab_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        AppBackground(),
        Align(alignment: Alignment.center, child: HorizontalTabLayout())
      ],
    ));
  }
}
