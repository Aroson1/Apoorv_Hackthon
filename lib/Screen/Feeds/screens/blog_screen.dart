import '../models/blog_model.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  @override
  final Blog? blog;

  const BlogScreen({super.key, this.blog});
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final Color primarycolor = const Color(0xFF1D1D1D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage(widget.blog!.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60.0),
                            topRight: Radius.circular(60.0)),
                      ),
                      child: const SizedBox(width: 1),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // height: 700,
              decoration: BoxDecoration(
                color: primarycolor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.blog!.name,
                      style: const TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "⭐ 4.5",
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        ),
                        const SizedBox(width: 20.0),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.timer,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              widget.blog!.created_at,
                              style:
                                  const TextStyle(color: Colors.grey, fontSize: 16.0),
                            )
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        const Row(
                          children: <Widget>[
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                            SizedBox(width: 2.0),
                            Text(
                              "7k Views",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16.0),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage(widget.blog!.author.imageUrl),
                          radius: 28.0,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          widget.blog!.author.name,
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      widget.blog!.content,
                      style: const TextStyle(
                          fontSize: 18.0, color: Colors.grey, letterSpacing: 1),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
