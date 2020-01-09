import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 2.1

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String data = 'my passed through data'; // 2.2
  @override
  Widget build(BuildContext context) {
    // 3.1:
    return Provider<String>(
      create: (context) => data, // use create instead of builder as per 4.0!
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(data), // 2.3
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context)); // 3.2
  }
}
