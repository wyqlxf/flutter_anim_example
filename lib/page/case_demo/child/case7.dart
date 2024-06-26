import 'package:flutter/material.dart';

class Case7 extends StatefulWidget {
  const Case7({super.key});

  @override
  Case7State createState() => Case7State();
}

class Case7State extends State<Case7> with SingleTickerProviderStateMixin {
  double position = 0.0;
  bool isMenuOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addListener(() {
      setState(() {
        position = _animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildDrawer(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 16),
      color: Colors.blue,
      child: Column(
          children: List.generate(
        10,
        (index) => ListTile(
          title: Text(
            'Item $index',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          onTap: () {},
        ),
      )),
    );
  }

  Widget _buildContent() {
    double scale =
        1 - (position / (MediaQuery.of(context).size.width * 0.6) * 0.3);
    double vertPosition = position / 2;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          position += details.delta.dx;
          if (position < 0) position = 0;
          if (position > MediaQuery.of(context).size.width * 0.6) {
            position = MediaQuery.of(context).size.width * 0.6;
          }
        });
      },
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          startAnimation(position, MediaQuery.of(context).size.width * 0.6);
          isMenuOpen = true;
        } else {
          startAnimation(position, 0.0);
          isMenuOpen = false;
        }
      },
      child: Transform(
        transform: Matrix4.identity()
          ..translate(position, vertPosition)
          ..scale(scale, scale),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.orange,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('侧滑菜单',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _toggleMenu,
                child: const Text('Toggle Menu'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Back to previous'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _toggleMenu() {
    if (isMenuOpen) {
      startAnimation(position, 0.0);
    } else {
      startAnimation(position, MediaQuery.of(context).size.width * 0.6);
    }
    isMenuOpen = !isMenuOpen;
  }

  void startAnimation(double startPosition, double endPosition) {
    _animation = Tween<double>(begin: startPosition, end: endPosition)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
