import 'package:firebase_winterhacks/Screen/HomePage.dart';
import 'package:firebase_winterhacks/Screen/profilePage.dart';

import '../Screen/Feeds/FeedsPage.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomTabBar.dart';
import '../models/tab_item.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedIndex = 1;
  List<String> screenName = ["Feed", "Home", "Profile"];

  void _updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var themeColor = Color(0xFF1D1D1D);
  var secondaryColor = Color(0xFF2B2B2B);
  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(screenName[_selectedIndex]),
              _selectedIndex == 0
                  ? Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0),
                        Icon(
                          Icons.menu,
                          size: 32.0,
                          color: Colors.white,
                        )
                      ],
                    )
                  : Text(""),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabBar(onTabSelected: _updateSelectedIndex),
      body: _selectedIndex == 0
          ? FeedsPage()
          : _selectedIndex == 1
              ? GlassmorphicGrid()
              : ProfilePage(user: data),
    );
  }
}
