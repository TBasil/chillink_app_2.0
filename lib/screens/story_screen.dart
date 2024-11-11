import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  final String title;
  final String imagePath;
  final String content;

  StoryScreen({
    required this.title,
    required this.imagePath,
    required this.content,
  });

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverAppBar(
            title: Text('Story'),
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: FadeTransition(
                opacity: _animationOpacity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 52,
                            fontFamily: 'FontMain',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.content,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
