import 'package:flutter/material.dart';

class Case1 extends StatefulWidget {
  const Case1({super.key});

  @override
  Case1State createState() => Case1State();
}

class Case1State extends State<Case1> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);

  List<IconData> firstIcon = [
    Icons.home,
    Icons.search,
    Icons.person_add_alt,
    Icons.settings,
  ];

  List<IconData> secondIcon = [
    Icons.home_filled,
    Icons.search_off,
    Icons.person_add_alt_1,
    Icons.settings_applications,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case1'),
        centerTitle: true,
        bottom: TabBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            });
          },
          controller: _tabController,
          tabs: List.generate(
            4,
            (index) => AnimatedDefaultTextStyle(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color:
                    _currentIndex == index ? Colors.blueAccent : Colors.black,
                fontSize: _currentIndex == index ? 20 : 12,
              ),
              child: Text(
                'Tab $index',
                maxLines: 1,
              ),
              onEnd: () {
                // 隐式动画的结束回调
              },
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _tabController.animateTo(index);
          });
        },
        children: List.generate(
          4,
          (index) => Center(
            child: Text('Page $index'),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
            _tabController.animateTo(index);
          });
        },
        items: List.generate(
          4,
          (index) {
            return BottomNavigationBarItem(
              icon: AnimatedCrossFade(
                firstCurve: Curves.fastOutSlowIn,
                crossFadeState: _currentIndex == index
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400),
                firstChild: Icon(
                  firstIcon[index],
                  size: 24,
                  color: Colors.blue,
                ),
                secondChild: Icon(
                  secondIcon[index],
                  size: 24,
                  color: Colors.black,
                ),
                alignment: Alignment.centerLeft,
                sizeCurve: Curves.easeInOut,
              ),
              label: 'Tab $index',
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
