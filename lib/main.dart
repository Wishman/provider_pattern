import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 2.1

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //final String data = 'my passed through data'; // 2.2 obsolete as per 4.3 (see below)
  @override
  Widget build(BuildContext context) {
    /* obsolete with 4.4
    // 3.1:
    return Provider<String>(
      create: (context) => data, // use create instead of builder as per 4.0!
    */
    // 4.4:
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(), //4.4
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(), // 2.3 (obsolete) & 4.1(b)
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
    // 4.2(b)
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Text(Provider.of<String>(context)); // 3.2 obsolete with 4.5
    return Text(Provider.of<Data>(context).data); // 4.5
  }
}

// 4.1(a)
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Text('myText needs data'); //obsolete with 4.6
    return Text(Provider.of<Data>(context).data); // 4.6
  }
}

// 4.2(a)
class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context).changeString(newText); // 4.8 !!!
      },
    );
  }
}

// 4.3
class Data with ChangeNotifier {
  String data = 'some dummy data in Data class';

  // 4.7:
  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
