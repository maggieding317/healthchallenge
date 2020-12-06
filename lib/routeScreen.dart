import 'package:flutter/material.dart';
import 'package:flutter_app/activityScreen.dart';
import 'package:flutter_app/scheduleScreen.dart';
import 'package:flutter_app/foodScreen.dart';
import 'package:flutter_app/profileScreen.dart';
import 'package:flutter_app/recommendation_activity.dart';
import 'recommendation.dart';
import 'foodRecommendationScreen.dart';
import 'yourFoodScreen.dart';

class RoutePage extends StatefulWidget {
  RoutePage(
      {Key key,
      this.title,
      this.recommendationActivity,
      this.foodRecommendation})
      : super(key: key);

  final String title;
  RecommendationActivity recommendationActivity;
  Recommendation foodRecommendation;

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions;
  static List<String> choices = ['Recommended Menu', 'Record Food'];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      FoodRecommendationPage(
        title: 'Recommended Menu',
        recommendation: widget.foodRecommendation,
      ),

      ProfilePage(
        title: "Me",
        recommendationAct: widget.recommendationActivity,
        recommendationFood: widget.foodRecommendation,
      ),
      yourFoodPage(
        title: 'Record Food',
        foodRecommendation: widget.foodRecommendation,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   getBottomNavigatorBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(255, 180, 105, 100),
      elevation: 0.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Nutrition'),
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('Me'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _selectedIndex == 0
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(255, 180, 105, 100),
                elevation: 0.0,
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      'Recommended Menu',
                      style: TextStyle(fontSize: 20),
                    )),
                    Tab(
                        child: Text(
                      'Record Food',
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
                leading: Container(),
              ),
              body: TabBarView(
                children: [
                  _widgetOptions.elementAt(_selectedIndex),
                  _widgetOptions.elementAt(2),
                ],
              ),
              bottomNavigationBar: getBottomNavigatorBar()
            ))
        : Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: getBottomNavigatorBar()
          );
  }
}
