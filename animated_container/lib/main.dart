import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedContainer Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height;
  double _width;
  Color _color;
  Duration _duration;
  double _radius;
  bool _isExpanded;

  @override
  void initState() {
    _defaultData();
    super.initState();
  }

  void _defaultData() {
    _height = 100.00;
    _width = 100.00;
    _color = Colors.green;
    _duration = Duration(milliseconds: 2000);
    _radius = 0.0;
    _isExpanded = false;
  }

  void _expandedData() {
    _color = Colors.deepOrange;
    _width = 200.0;
    _height = 200.0;
    _radius = 8.0;
    _isExpanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer Demo"),
      ),
      body: Center(child: _buildAnimation()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isExpanded ? _defaultData() : _expandedData();
          });
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }

  Widget _buildAnimation() {
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.bounceIn,
      height: _height,
      width: _width,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(_radius),
      ),
    );
  }
}
