import 'package:flutter/material.dart';
import 'package:flutter_ui/flight_list_ui/CustomAppBar.dart';
import 'CustomShapeClipper.dart';
import 'package:intl/intl.dart';

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);
Color primaryColor = Color(0xFFF3791a);

TextStyle dropDownLabelItemStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

List<String> locations = ['北京', '上海'];

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[HomeScreenTopPart(), HomeScreenBottomPart()],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  HomeScreenTopPart({Key key}) : super(key: key);

  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedIndex = 0;
  bool isFlightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    PopupMenuButton(
                      onSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            locations[selectedIndex],
                            style: dropDownLabelItemStyle,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
                        PopupMenuItem(
                          child:
                              Text(locations[0], style: dropDownMenuItemStyle),
                          value: 0,
                        ),
                        PopupMenuItem(
                          child:
                              Text(locations[1], style: dropDownMenuItemStyle),
                          value: 1,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'where would\n you want to go?',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: TextField(
                    controller: TextEditingController(text: locations[0]),
                    style: dropDownMenuItemStyle,
                    cursorColor: firstColor,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 13.0),
                        border: InputBorder.none,
                        suffixIcon: Material(
                            elevation: 2,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ))),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = true;
                      });
                    },
                    child: Choicechip(
                      icon: Icons.flight_takeoff,
                      text: '飞机',
                      isSelected: isFlightSelected,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },
                    child: Choicechip(
                        icon: Icons.hotel,
                        text: '酒店',
                        isSelected: !isFlightSelected),
                  )
                ],
              )
            ]),
          ),
        )
      ],
    );
  }
}

class Choicechip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  Choicechip({this.icon, this.text, this.isSelected});

  @override
  _ChoicechipState createState() => _ChoicechipState();
}

class _ChoicechipState extends State<Choicechip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.icon, color: Colors.white, size: 20),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

class HomeScreenBottomPart extends StatelessWidget {
  HomeScreenBottomPart({Key key}) : super(key: key);
  final viewAllStyle = TextStyle(color: primaryColor, fontSize: 14.0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('当前', style: dropDownMenuItemStyle),
              Text('查看全部 (12)', style: viewAllStyle),
            ],
          ),
        ),
        Container(
          height: 240.0,
          child:
              ListView(scrollDirection: Axis.horizontal, children: cityCards),
        ),
      ],
    );
  }
}

List<CityCard> cityCards = [
  CityCard("assets/images/lasvegas.jpg", "拉斯维加斯", "2019.2", "45", 4299, 2250),
  CityCard("assets/images/athens.jpg", "雅典", "2019.6", "50", 9999, 4159),
  CityCard("assets/images/sydney.jpeg", "悉尼", "2018.12", "40", 5999, 2399),
];
final formatCurrency = new NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount;
  final int oldPrice, newPrice;
  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  width: 160.0,
                  height: 210.0,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 80.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.01)
                        ])),
                  ),
                ),
                Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    right: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(cityName,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(monthYear,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ]),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.white),
                            child: Text("$discount%",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black)))
                      ],
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            width: 160.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(width: 5.0),
                Text('${formatCurrency.format(newPrice)}',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(width: 5.0),
                Text('(${formatCurrency.format(oldPrice)})',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
