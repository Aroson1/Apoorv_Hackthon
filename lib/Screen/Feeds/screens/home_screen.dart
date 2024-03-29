// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../widgets/blog_posts.dart';
import '../widgets/recent_posts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primarycolor = Color(0xFF1D1D1D);
  final Color secondaryColor = Color(0xFF2B2B2B);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Bookmarked Posts",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              BlogPosts(),
              Container(
                color: primarycolor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recent Posts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            color: Colors.lightBlueAccent, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
              RecentPosts()
            ],
          )
        ],
      ),
    );
  }
}
