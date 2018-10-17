import 'package:flutter/material.dart';
import 'logo_animation.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double animationSize = 0.0;
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController)
      ..addListener(() {
        setState(() {
          animationSize = animation.value;
        });
      });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Size: $animationSize"),
        ),
        body: LogoAnimation(
          animation: animation,
        ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
