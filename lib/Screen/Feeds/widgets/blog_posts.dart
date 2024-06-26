import '../models/blog_model.dart';
import '../screens/blog_screen.dart';
import 'package:flutter/material.dart';

class BlogPosts extends StatelessWidget {
  final Color primarycolor = const Color(0xFF1D1D1D);

  const BlogPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          height: MediaQuery.of(context).size.width * 0.90,
          color: primarycolor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: blogs.length,
            itemBuilder: (BuildContext context, int index) {
              final Blog blog = blogs[index];
              return GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BlogScreen(blog: blog)))
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Colors.black,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(66, 255, 255, 255),
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.10)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Image(
                              image: AssetImage(blog.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          )),
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: Text(
                                blog.name,
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.6,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 10.0,
                                    backgroundImage:
                                        AssetImage(blog.author.imageUrl)),
                                const SizedBox(width: 8.0),
                                Text(blog.author.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14.0)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.timer,
                              size: 10.0,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5.0),
                            Text(blog.created_at,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ))
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: Icon(Icons.bookmark,
                            size: 26.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5.0)
      ],
    );
  }
}
