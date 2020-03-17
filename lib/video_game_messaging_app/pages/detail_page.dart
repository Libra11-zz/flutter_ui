import 'package:flutter/material.dart';
import 'package:flutter_ui/model/forum.dart';
import 'package:flutter_ui/model/topic.dart';
import 'package:flutter_ui/video_game_messaging_app/common/app_background.dart';
import 'package:flutter_ui/video_game_messaging_app/common/forum_details_widget.dart';
import 'package:flutter_ui/video_game_messaging_app/styleguide/colors.dart';
import 'package:flutter_ui/video_game_messaging_app/styleguide/text_styles.dart';

class DetailPage extends StatefulWidget {
  final Forum forum;
  DetailPage({this.forum});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(_controller);
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstCircleColor: firstOrangeCircleColor,
            secondCircleColor: secondOrangeCircleColor,
            thirdCircleColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50.0),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              SizedBox(height: 30.0),
              FutureBuilder(
                  future: _playAnimation(),
                  builder: (context, snapshot) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, right: 100.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            LabelValueWidget(
                              value: widget.forum.topics.length.toString(),
                              label: "topics",
                              labelStyle: whiteLabelTextStyle,
                              valueStyle: whiteValueTextStyle,
                            ),
                            LabelValueWidget(
                              value: widget.forum.threads,
                              label: "threads",
                              labelStyle: whiteLabelTextStyle,
                              valueStyle: whiteValueTextStyle,
                            ),
                            LabelValueWidget(
                              value: widget.forum.subs,
                              label: "subs",
                              labelStyle: whiteLabelTextStyle,
                              valueStyle: whiteValueTextStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 30.0),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60.0)),
                    child: Image.asset(widget.forum.imagePath)),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              child: Container(
                  height: 300.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, left: 16.0, right: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Topics', style: subHeadingStyle),
                          Expanded(
                            child: SlideTransition(
                              position: _offsetAnimation,
                              child:
                                  ListView(shrinkWrap: true, children: <Widget>[
                                TopicsTitle(topic: widget.forum.topics[0]),
                                TopicsTitle(topic: widget.forum.topics[1]),
                              ]),
                            ),
                          )
                        ]),
                  )),
            ),
          ),
          Positioned(
            bottom: 275.0,
            right: 20,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Align(
                alignment: Alignment.topRight,
                child: Material(
                    elevation: 10.0,
                    shape: CircleBorder(),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.forum.rank, style: rankBigStyle),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopicsTitle extends StatelessWidget {
  final Topic topic;
  const TopicsTitle({this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(topic.question, style: topicQuestionStyle),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: primaryColor),
                child: Text(topic.answerCount, style: topicAnswerStyle),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              topic.recentAnswer,
              style: topicAnswerStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
