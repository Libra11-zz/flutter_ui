import 'package:flutter/material.dart';
import 'package:flutter_ui/video_game_messaging_app/styleguide/text_styles.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String text;
  Function onTabTap;

  TabText({this.text, this.isSelected = false, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -1.58,
        child: InkWell(
          onTap: onTabTap,
          child: AnimatedDefaultTextStyle(
            style: isSelected ? selectedTabStyle : defaultTabStyle,
            duration: Duration(milliseconds: 500),
            child: Text(
              text,
            ),
          ),
        ));
  }
}
