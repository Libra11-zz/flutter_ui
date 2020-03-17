import 'package:flutter/material.dart';
import 'package:flutter_ui/video_game_messaging_app/common/app_background.dart';
import 'package:flutter_ui/video_game_messaging_app/common/horizontal_tab_layout.dart';
import 'package:flutter_ui/video_game_messaging_app/styleguide/colors.dart';
import 'package:flutter_ui/video_game_messaging_app/styleguide/text_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        AppBackground(
          firstCircleColor: firstCircleColor,
          secondCircleColor: secondCircleColor,
          thirdCircleColor: thirdCircleColor,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          SizedBox(height: 50.0),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Material(
                shape: CircleBorder(),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.apps,
                    color: primaryColor,
                  ),
                ),
                color: Colors.white,
              ),
            ),
          ),
          HeadingSubHeadingWidget(),
          HorizontalTabLayout(),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
              child: Text('New Topic', style: buttonStyle),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20.0))),
            ),
          )
        ])
      ],
    ));
  }
}

class HeadingSubHeadingWidget extends StatelessWidget {
  const HeadingSubHeadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Forum", style: headingStyle),
            Text("Kick of the conversation", style: subHeadingStyle),
          ]),
    );
  }
}
