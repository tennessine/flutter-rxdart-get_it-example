import 'package:flutter/material.dart';
import 'package:flutter_app/service_locator.dart';
import 'package:flutter_app/widgets/connected_button.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ConnectedButton(id: 0),
            ConnectedButton(id: 1),
            ConnectedButton(id: 2),
          ],
        ),
      ),
    );
  }
}
