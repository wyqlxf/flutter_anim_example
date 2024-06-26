import 'package:flutter/material.dart';

class Case6 extends StatefulWidget {
  const Case6({super.key});

  @override
  Case6State createState() => Case6State();
}

class Case6State extends State<Case6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case6'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                showDialog();
              },
              child: const Text(
                '点击弹窗',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(6),
        topRight: Radius.circular(6),
      )),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 260,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
          child: Column(
            children: [
              const Text(
                '分享至',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ShareSheet(
                    interval: 0,
                    child: icon('分享好友', Icons.share, Colors.red),
                  ),
                  ShareSheet(
                    interval: 100,
                    child: icon('微信好友', Icons.wechat, Colors.green),
                  ),
                  ShareSheet(
                    interval: 200,
                    child: icon('朋友圈', Icons.people, Colors.blue),
                  ),
                  ShareSheet(
                    interval: 300,
                    child: icon('QQ好友', Icons.accessibility, Colors.orange),
                  ),
                  ShareSheet(
                    interval: 400,
                    child: icon('微博', Icons.cloud, Colors.pink),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ShareSheet(
                    interval: 0,
                    child: icon('群聊分享', Icons.group, Colors.white,
                        iconColor: Colors.grey),
                  ),
                  ShareSheet(
                    interval: 100,
                    child: icon('图片分享', Icons.image, Colors.white,
                        iconColor: Colors.grey),
                  ),
                  ShareSheet(
                    interval: 200,
                    child: icon('内容编辑', Icons.edit_note, Colors.white,
                        iconColor: Colors.grey),
                  ),
                  ShareSheet(
                    interval: 300,
                    child: icon('置顶文章', Icons.vertical_align_top, Colors.white,
                        iconColor: Colors.grey),
                  ),
                  ShareSheet(
                    interval: 400,
                    child: icon('复制链接', Icons.copy, Colors.white,
                        iconColor: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget icon(String name, IconData icon, Color color,
      {Color iconColor = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class ShareSheet extends StatefulWidget {
  final Widget child;
  final int interval;

  const ShareSheet({super.key, required this.child, required this.interval});

  @override
  SharingSheetState createState() => SharingSheetState();
}

class SharingSheetState extends State<ShareSheet>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), // 设置动画总时长
      vsync: this,
    );

    _animations = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成时，反转动画
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画回到起始位置时，重新开始动画
      }
    });

    Future.delayed(Duration(milliseconds: widget.interval), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animations.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
