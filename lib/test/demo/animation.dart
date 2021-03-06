import 'package:flutter/material.dart';

//https://www.jianshu.com/p/96e1ae828b13
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 动画',
      theme: ThemeData(
//        primaryColor: Colors.blue, // App 主要的背景色
        primarySwatch: Colors.blue, //  这是所有的色调
      ),
      home: AnimationWidget()));
}

class AnimationWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimationWidget> with TickerProviderStateMixin {
  AnimationController mAnimatedContainer;
  CurvedAnimation curve;

  var isClick = true;

  @override
  void initState() {
    super.initState();
    mAnimatedContainer = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: mAnimatedContainer, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 动画'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Fade",
        child: Icon(Icons.brush),
        onPressed: () {
          if(isClick){
            isClick = false;
            mAnimatedContainer.forward(); // 用来开始动画，即从无到有
          } else {
            isClick = true;
            mAnimatedContainer.reverse();  // 用来反向开始动画，即从有到无
          }
//          ScaleTransition(scale: animation, child: FlutterLogo(size: 100.0));
        },
      ),
    );
  }
}
