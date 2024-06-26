import 'package:flutter/material.dart';

class Case3 extends StatefulWidget {
  const Case3({super.key});

  @override
  Case3State createState() => Case3State();
}

class Case3State extends State<Case3> with SingleTickerProviderStateMixin {
  /// 偏移量
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case3'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  // 滚动开始
                  setState(() {
                    _offset = const Offset(0.6, 0);
                  });
                } else if (scrollNotification is ScrollEndNotification) {
                  // 滚动结束
                  setState(() {
                    _offset = Offset.zero;
                  });
                } else if (scrollNotification is ScrollUpdateNotification) {
                  // 正在滚动
                }
                return false;
              },
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 68,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.primaries[index % Colors.primaries.length]
                            .withOpacity(0.5),
                      ),
                      alignment: Alignment.center,
                      child: Text('Item $index'),
                    );
                  },
                  itemCount: 1000),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: AnimatedSlide(
                offset: _offset,
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 200),
                child: _buildAction(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction() {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.8),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.photo,
              size: 100,
              color: Colors.white,
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(Icons.cancel),
          ),
        ],
      ),
    );
  }
}
