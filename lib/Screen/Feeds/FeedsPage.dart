import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(FeedsPage());

class FeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: HomeScreen());
  }
}