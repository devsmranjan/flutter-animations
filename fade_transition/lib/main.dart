import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Transition Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    final animation = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(controller);
    controller.forward();

    return Scaffold(
      appBar: AppBar(
        title: Text("Fade Transition Demo"),
      ),
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Text("Hello World!", style: TextStyle(
            fontSize: 48.0
          ),),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
