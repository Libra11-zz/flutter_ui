import 'package:flutter/material.dart';
import 'package:flutter_ui/model/forum.dart';
import 'package:flutter_ui/video_game_messaging_app/common/forum_card.dart';
import 'package:flutter_ui/video_game_messaging_app/common/tab_text.dart';

class HorizontalTabLayout extends StatefulWidget {
  HorizontalTabLayout({Key key}) : super(key: key);

  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Stack(children: <Widget>[
        Positioned(
          left: -20,
          bottom: 0,
          top: 0,
          width: 110.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TabText(
                  text: "Media",
                  isSelected: selectedTabIndex == 0,
                  onTabTap: () {
                    onTabTap(0);
                  },
                ),
                TabText(
                  text: "Streamers",
                  isSelected: selectedTabIndex == 1,
                  onTabTap: () {
                    onTabTap(1);
                  },
                ),
                TabText(
                  text: "Forum",
                  isSelected: selectedTabIndex == 2,
                  onTabTap: () {
                    onTabTap(2);
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ForumCard(
                forum: fortniteForum,
              ),
              ForumCard(
                forum: pubgForum,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
