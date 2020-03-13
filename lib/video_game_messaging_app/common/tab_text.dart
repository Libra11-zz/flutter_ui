import 'package:flutter/material.dart';
import 'package:flutter_ui/video_game_messaging_app/styleguide/text_styles.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String text;
  Function onTabTap;

  TabText({this.text, this.isSelected, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabTap,
      child: Transform.rotate(
          angle: -1.58,
          child: Text(text,
              style: isSelected ? selectedTabStyle : defaultTabStyle)),
    );
  }
}
