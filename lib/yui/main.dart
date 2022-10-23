import 'package:flutter/material.dart';
import 'package:flutter_sample/yui/yui.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final yellow = const ColoredBox(color: Colors.yellow).yui(
      onAppeaer: () {
        print('Yellow が表示されました');
      },
      onDisappeaer: () {
        print('Yellow が削除されました');
      },
      width: 300,
      height: 300,
    );
    return MaterialApp(
      home: Scaffold(body: Center(child: yellow)),
    );
  }
}
