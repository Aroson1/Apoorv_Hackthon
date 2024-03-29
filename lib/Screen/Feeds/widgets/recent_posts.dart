import '../models/blog_model.dart';
import 'package:flutter/material.dart';

class RecentPosts extends StatelessWidget {
  final Color primarycolor = const Color(0xFF1D1D1D);

  const RecentPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primarycolor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: blogs
              .map((blog) => Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(color: primarycolor, boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 70, 70, 70),
                          offset: Offset(0.0, 5.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.1)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: 110,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                image: AssetImage(blog.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 5.0),
                                Text(
                                  blog.author.name,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                SizedBox(
                                  height: 65,
                                  child: Text(
                                    blog.name,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.timer,
                                          color: Colors.grey,
                                          size: 12.0,
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          blog.created_at,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 20.0),
                                    const Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.grey,
                                          size: 12.0,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "7k Views",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
