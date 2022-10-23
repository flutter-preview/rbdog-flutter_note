import 'package:flutter/material.dart';
import 'package:flutter_sample/side_menu.dart';

main() {
  // アップバー
  final appBar = AppBar(
    title: const Text('appBar'),
  );

  // ドロワー
  const drawer = Drawer(
    child: SideMenu(),
  );

  // エンドドロワー
  const endDrawer = Drawer(
    child: SideMenu(),
  );

  // 画面
  final scaffold = Scaffold(
    appBar: appBar,
    drawer: drawer,
    endDrawer: endDrawer,
  );

  // アプリ
  final app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: scaffold,
  );

  runApp(app);
}
