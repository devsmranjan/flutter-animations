import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opacity Demo',
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

class _MyHomePageState extends State<MyHomePage> {
  double _opacityValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity Demo"),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _opacityValue >= 1.0 ? _opacityValue = 0.0 : _opacityValue = 1.0;
          });
        },
        child: Icon(Icons.repeat),
      ),
    );
  }

  Widget _buildBody() {
    return new Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan[400], Colors.grey[400]])),
          ),
        ),
        Center(
          child: new AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: _opacityValue,
            child: Image.asset(
              'images/athena.png',
              height: 150.0,
            ),
          ),
        )
      ],
    );
  }
}
