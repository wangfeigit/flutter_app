import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './cart_page.dart';
import './category_page.dart';
import './home_page.dart';
import './mine_page.dart';

class IndexWidget extends StatefulWidget {
  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {

  int currentIndex = 0;
  var currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = PAGE_WIDGET[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width =size.width;  // 屏幕宽度
    final height =size.height;  // 屏幕高度
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      // 设置这个组件就会把里面的组件置于最底部
      bottomNavigationBar: BottomNavigationBar(
//        backgroundColor: Color.fromRGBO(244, 255, 255, 1.0),
        type: BottomNavigationBarType.fixed,
        items: BOTTOMTABS,
        currentIndex: currentIndex,
        onTap: (index) {
          // 刷新组件的方法
          setState(() {
            currentIndex = index;
            currentWidget = PAGE_WIDGET[currentIndex];
          });
        },
      ),
      // TODO 为了页面保持状态 改造一下
//      body: currentWidget,
      body: IndexedStack(
        index: currentIndex,
        children: PAGE_WIDGET,
      ),
    );
  }
}

const BOTTOMTABS = [
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.home),
    title: Text('首页'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.search),
    title: Text('分类'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.shopping_cart),
    title: Text('购物车'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.profile_circled),
    title: Text('我的'),
  ),
];

final List<Widget> PAGE_WIDGET = [HomePage(), CategoryPage(), CartPage(), MinePage()];