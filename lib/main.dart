import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Splash Gram',
        theme: ThemeData.dark(),
        home: Center(
          child: Text('Splash Gram'),
        ));
  }
}
