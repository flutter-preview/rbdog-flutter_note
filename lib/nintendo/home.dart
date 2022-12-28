import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/my_page.dart';

// 選択中のタブインデックス
final indexProvider = StateProvider((ref) {
  return 2;
});

// ホーム画面全体
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックス
    final index = ref.watch(indexProvider);

    // アイテムたち
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.tv_outlined),
        label: 'ニュース',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        label: 'ストア',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_rounded),
        label: 'Myページ',
      ),
    ];

    // 下のバー
    final bar = BottomNavigationBar(
      items: items,
      backgroundColor: MyColors.white, // バーの色
      selectedItemColor: MyColors.red, // 選ばれたアイテムの色
      unselectedItemColor: MyColors.darkGrey, // 選ばれていないアイテムの色
      currentIndex: index,
      onTap: (index) {
        // タップされたとき インデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
      elevation: 0,
    );

    // 画面たち
    const pages = [
      Scaffold(),
      Scaffold(),
      MyPage(),
    ];

    return ColoredBox(
      color: MyColors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.lightGrey,
          body: pages[index],
          bottomNavigationBar: bar,
        ),
      ),
    );
  }
}
