import 'package:flutter/material.dart';

class YuiWidget extends StatefulWidget {
  const YuiWidget({
    super.key,
    required this.onAppeaer,
    required this.onDisappeaer,
    required this.width,
    required this.height,
    required this.child,
  });

  final void Function()? onAppeaer;
  final void Function()? onDisappeaer;
  final double? width;
  final double? height;
  final Widget child;

  @override
  State<YuiWidget> createState() => _YuiWidgetState();
}

class _YuiWidgetState extends State<YuiWidget> {
  @override
  void initState() {
    super.initState();
    widget.onAppeaer?.call();
  }

  @override
  void dispose() {
    widget.onDisappeaer?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: widget.child,
    );
  }
}

extension AsYuiWidget on Widget {
  YuiWidget yui({
    final void Function()? onAppeaer,
    final void Function()? onDisappeaer,
    final double? width,
    final double? height,
  }) {
    return YuiWidget(
      onAppeaer: onAppeaer,
      onDisappeaer: onDisappeaer,
      width: width,
      height: height,
      child: this,
    );
  }
}

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
