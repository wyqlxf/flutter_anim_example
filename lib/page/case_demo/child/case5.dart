import 'package:flutter/material.dart';

class Case5 extends StatefulWidget {
  const Case5({super.key});

  @override
  Case5State createState() => Case5State();
}

class Case5State extends State<Case5> {
  @override
  Widget build(BuildContext context) {
    const double offsetX = 0.7;
    final double optionsWidth = MediaQuery.of(context).size.width * offsetX;
    const double itemHeight = 58;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case5'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            GlobalKey<SlideListItemState> key = GlobalKey();
            return Column(
              children: [
                SlideListItem(
                  key: key,
                  offsetX: offsetX,
                  options: optionsWidget(optionsWidth, itemHeight, key),
                  child: Container(
                    width: double.infinity,
                    height: itemHeight,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text('Title $index'),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget optionsWidget(
      double width, double height, GlobalKey<SlideListItemState> key) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height,
            color: Colors.blue,
            child: TextButton(
                onPressed: () {
                  key.currentState!
                      .closeOptions(); // Call the closeOptions method
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('置顶成功')),
                  );
                },
                child: const Text('置顶',
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ),
          Container(
            height: height,
            color: Colors.orange,
            child: TextButton(
                onPressed: () {
                  key.currentState!
                      .closeOptions(); // Call the closeOptions method
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('标记未读成功')),
                  );
                },
                child: const Text('标记未读',
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ),
          Container(
            height: height,
            color: Colors.red,
            child: TextButton(
                onPressed: () {
                  key.currentState!
                      .closeOptions(); // Call the closeOptions method
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('删除成功')),
                  );
                },
                child: const Text('删除',
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ),
        ],
      ),
    );
  }
}

class SlideListItem extends StatefulWidget {
  final Widget child;
  final Widget options;
  final double offsetX;

  const SlideListItem({
    required this.child,
    required this.options,
    required this.offsetX,
    super.key,
  });

  @override
  SlideListItemState createState() => SlideListItemState();
}

class SlideListItemState extends State<SlideListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _contentAnimation;
  late Animation<Offset> _optionsAnimation;
  double _dragStartX = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _contentAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(-widget.offsetX, 0.0))
            .animate(_controller);
    _optionsAnimation =
        Tween<Offset>(begin: Offset(widget.offsetX, 0.0), end: Offset.zero)
            .animate(_controller);
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    SlideListItemManager().setActiveItem(this);
    _dragStartX = details.globalPosition.dx;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final offsetX = details.globalPosition.dx - _dragStartX;
    _controller.value -= offsetX / context.size!.width;
    _dragStartX = details.globalPosition.dx;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    const double flingVelocity = 2.0;
    if (details.velocity.pixelsPerSecond.dx.abs() >= flingVelocity) {
      final double visualVelocity =
          -details.velocity.pixelsPerSecond.dx / context.size!.width;
      _controller.fling(velocity: visualVelocity);
    } else {
      if (_controller.value > 0.5) {
        _controller.reverse();
        SlideListItemManager().clearActiveItem();
      } else {
        _controller.forward();
        SlideListItemManager().setActiveItem(this);
      }
    }
  }

  void closeOptions() {
    _controller.reverse();
    SlideListItemManager().clearActiveItem();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Stack(
        children: [
          Positioned.fill(
            child: SlideTransition(
              position: _optionsAnimation,
              child: widget.options,
            ),
          ),
          ClipRect(
            child: SlideTransition(
              position: _contentAnimation,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SlideListItemManager().clearActiveItem();
    _controller.dispose();
    super.dispose();
  }
}

class SlideListItemManager {
  static final SlideListItemManager _instance =
      SlideListItemManager._internal();

  SlideListItemState? _activeItem;

  factory SlideListItemManager() {
    return _instance;
  }

  SlideListItemManager._internal();

  void setActiveItem(SlideListItemState item) {
    _activeItem?.closeOptions();
    _activeItem = item;
  }

  void clearActiveItem() {
    _activeItem = null;
  }
}
