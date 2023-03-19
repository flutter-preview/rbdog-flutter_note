import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  final preview = DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
  );
  runApp(preview);
}

/// アプリ本体
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      useInheritedMediaQuery: true, // device_preview に必要
      home: HomePage(),
    );
  }
}

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('バナナ'),
      ),
    );
  }
}
