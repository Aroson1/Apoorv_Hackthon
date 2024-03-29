import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(const FeedsPage());

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const HomeScreen());
  }
}
