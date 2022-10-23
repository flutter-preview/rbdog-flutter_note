import 'package:flutter/material.dart';

//
//
//

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final header = DrawerHeader(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: Container(
        color: Colors.grey[200],
        alignment: Alignment.center,
        child: const Text('ドロワーヘッダー'),
      ),
    );

    final tileA = ListTile(
      title: Text('リストタイル A'),
      onTap: () {
        debugPrint('リストタイル A をタップしました');
      },
      leading: Icon(Icons.mail),
    );

    final tileB = ListTile(
      title: Text('リストタイル B'),
      onTap: () {
        debugPrint('リストタイル B をタップしました');
      },
      leading: Icon(Icons.stadium_outlined),
    );

    final tileC = ListTile(
      title: Text('リストタイル C'),
      onTap: () {
        debugPrint('リストタイル C をタップしました');
      },
      leading: Icon(Icons.save_sharp),
    );

    // 縦に並べる
    final list = ListView(
      children: [
        header, // ヘッダー
        tileA, // タイル A
        tileB, // タイル B
        tileC, // タイル C
      ],
    );

    return list;
  }
}
